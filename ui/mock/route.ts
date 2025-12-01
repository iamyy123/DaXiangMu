import cryptoMock from './cryptoMock';

export default {
  '/api/auth_routes': {
    '/form/advanced-form': { authority: ['admin', 'user'] },
  },
  ...cryptoMock
};
