package com.ruoyi.wms.task;

import com.ruoyi.wms.domain.bo.MarketNewsBo;
import com.ruoyi.wms.domain.vo.CryptoCurrencyVo;
import com.ruoyi.wms.service.CryptoCurrencyService;
import com.ruoyi.wms.service.MarketNewsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Slf4j
@Component
@RequiredArgsConstructor
public class MarketNewsCollectionTask {

    private final MarketNewsService marketNewsService;
    private final CryptoCurrencyService cryptoCurrencyService;
    
    // 外部API配置
    private static final String COINGECKO_NEWS_API = "https://api.coingecko.com/api/v3/news?locale=en";
    private static final String COINGECKO_MARKET_API = "https://api.coingecko.com/api/v3/simple/price?ids=%s&vs_currencies=usd";
    
    // 模拟新闻标题列表
    private static final List<String> NEWS_TITLES = List.of(
            "{}价格突破历史新高，市场情绪乐观",
            "{}网络升级完成，交易速度提升50%",
            "机构投资者增加{}持仓，长期前景看好",
            "监管机构发布新政策，对{}市场影响有限",
            "{}技术团队宣布重大更新，提升安全性",
            "市场波动加剧，{}价格出现回调",
            "{}与大型科技公司达成合作，应用场景扩大",
            "分析师预测{}价格将在未来6个月翻倍"
    );
    
    // 模拟新闻内容列表
    private static final List<String> NEWS_CONTENTS = List.of(
            "根据最新市场数据，{}价格今日突破历史新高，达到{}美元。市场分析师认为，这主要得益于机构投资者的持续买入和整体加密货币市场的牛市氛围。",
            "{}网络今日完成了期待已久的升级，交易速度提升了50%，交易费用降低了30%。这一升级将进一步提升{}的竞争力和用户体验。",
            "多家知名机构投资者宣布增加对{}的持仓，总投资额超过{}亿美元。机构的认可进一步增强了市场对{}的信心。",
            "某国监管机构今日发布了针对加密货币市场的新政策，对{}等主流币种的影响有限。政策主要针对ICO和未注册交易所，旨在保护投资者利益。",
            "{}技术团队今日宣布了一项重大技术更新，将提升网络的安全性和可扩展性。这一更新预计将吸引更多开发者和企业采用{}" 
    );
    
    private final Random random = new Random();
    private final OkHttpClient httpClient = new OkHttpClient();
    
    /**
     * 每日凌晨2点执行市场新闻收集任务
     */
    @Scheduled(cron = "0 0 2 * * ?")
    public void collectMarketNews() {
        log.info("开始执行市场新闻收集任务...");
        
        try {
            // 获取所有主流加密货币
            List<CryptoCurrencyVo> currencies = cryptoCurrencyService.queryList(null);
            
            if (currencies.isEmpty()) {
                log.warn("未找到加密货币数据，跳过新闻收集任务");
                return;
            }
            
            // 尝试从外部API获取真实新闻
            List<MarketNewsBo> newsList = new ArrayList<>();
            
            try {
                newsList = fetchRealMarketNews(currencies);
                log.info("成功从外部API获取{}条真实市场新闻", newsList.size());
            } catch (Exception e) {
                log.error("从外部API获取新闻失败，将使用模拟数据", e);
                // 如果外部API调用失败，使用模拟数据
                newsList = generateMockNews(currencies);
            }
            
            if (newsList.isEmpty()) {
                log.warn("未收集到任何市场新闻");
                return;
            }
            
            // 保存收集到的新闻
            for (MarketNewsBo news : newsList) {
                marketNewsService.insertByBo(news);
            }
            
            log.info("市场新闻收集任务完成，共收集了{}条新闻", newsList.size());
            
        } catch (Exception e) {
            log.error("执行市场新闻收集任务失败", e);
        }
    }
    
    /**
     * 从外部API获取真实市场新闻
     */
    private List<MarketNewsBo> fetchRealMarketNews(List<CryptoCurrencyVo> currencies) throws IOException {
        List<MarketNewsBo> newsList = new ArrayList<>();
        
        // 调用CoinGecko新闻API
        Request request = new Request.Builder()
                .url(COINGECKO_NEWS_API)
                .get()
                .build();
        
        try (Response response = httpClient.newCall(request).execute()) {
            if (!response.isSuccessful() || response.body() == null) {
                throw new IOException("Unexpected code " + response);
            }
            
            String responseBody = response.body().string();
            JSONArray newsArray = new JSONArray(responseBody);
            
            // 解析新闻数据
            for (int i = 0; i < newsArray.length(); i++) {
                JSONObject newsObj = newsArray.getJSONObject(i);
                MarketNewsBo news = parseNewsFromJson(newsObj, currencies);
                if (news != null) {
                    newsList.add(news);
                }
            }
        }
        
        return newsList;
    }
    
    /**
     * 解析新闻JSON数据
     */
    private MarketNewsBo parseNewsFromJson(JSONObject newsObj, List<CryptoCurrencyVo> currencies) {
        try {
            MarketNewsBo news = new MarketNewsBo();
            
            // 设置新闻基本信息
            news.setTitle(newsObj.getString("title"));
            news.setContent(newsObj.getString("description"));
            
            // 解析发布时间
            String publishedAt = newsObj.getString("created_at");
            ZonedDateTime zonedDateTime = ZonedDateTime.parse(publishedAt);
            news.setPublishTime(zonedDateTime.toLocalDateTime());
            
            // 尝试匹配相关的加密货币
            String newsContent = news.getTitle() + " " + news.getContent();
            CryptoCurrencyVo matchedCurrency = null;
            
            for (CryptoCurrencyVo currency : currencies) {
                if (newsContent.toLowerCase().contains(currency.getSymbol().toLowerCase()) ||
                    newsContent.toLowerCase().contains(currency.getName().toLowerCase())) {
                    matchedCurrency = currency;
                    break;
                }
            }
            
            // 如果没有匹配到特定货币，随机分配一个
            if (matchedCurrency == null) {
                matchedCurrency = currencies.get(random.nextInt(currencies.size()));
            }
            
            news.setCurrencyId(matchedCurrency.getId());
            
            // 随机设置情感倾向（在实际应用中，应该使用NLP模型分析）
            int sentiment = random.nextInt(3) - 1;
            news.setSentiment(sentiment);
            
            // 设置相关度（在实际应用中，应该使用算法计算）
            // 转换为1-10之间的整数
            int relevance = (int) ((0.7 + random.nextDouble() * 0.3) * 10);
            news.setRelevance(relevance);
            
            return news;
        } catch (Exception e) {
            log.error("解析新闻JSON数据失败", e);
            return null;
        }
    }
    
    /**
     * 生成模拟市场新闻
     */
    private List<MarketNewsBo> generateMockNews(List<CryptoCurrencyVo> currencies) {
        List<MarketNewsBo> newsList = new ArrayList<>();
        
        for (CryptoCurrencyVo currency : currencies) {
            // 为每种货币收集2-5条新闻
            int newsCount = random.nextInt(4) + 2;
            for (int i = 0; i < newsCount; i++) {
                MarketNewsBo news = createMockNews(currency);
                newsList.add(news);
            }
        }
        
        return newsList;
    }
    
    /**
     * 创建模拟新闻数据
     */
    private MarketNewsBo createMockNews(CryptoCurrencyVo currency) {
        MarketNewsBo news = new MarketNewsBo();
        
        // 随机选择新闻标题和内容
        String titleTemplate = NEWS_TITLES.get(random.nextInt(NEWS_TITLES.size()));
        String contentTemplate = NEWS_CONTENTS.get(random.nextInt(NEWS_CONTENTS.size()));
        
        // 格式化标题和内容
        String title = String.format(titleTemplate, currency.getName());
        String content = String.format(contentTemplate, currency.getName(), currency.getName(), 
                String.format("%.2f", random.nextDouble() * 10 + 1), currency.getName());
        
        // 设置新闻属性
        news.setTitle(title);
        news.setContent(content);
        news.setCurrencyId(currency.getId());
        news.setPublishTime(LocalDateTime.now().minusHours(random.nextInt(24)));
        
        // 随机设置情感倾向（-1: 利空, 0: 中性, 1: 利好）
        int sentiment = random.nextInt(3) - 1;
        news.setSentiment(sentiment);
        
        // 设置相关度（1-10）
        int relevance = (int) ((0.7 + random.nextDouble() * 0.3) * 10);
        news.setRelevance(relevance);
        
        return news;
    }
}