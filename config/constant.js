module.exports = {
  httpStatus: {
    ok: 200,
    badRequest: 400,
    notFound: 404,
    unauthorized: 401,
    forbidden: 403,
    internalServerError: 500
  },
  errorCodes: {
    missingParameter: '0000',
    internalServerError: '9999',
    customerNotFound: '0001',
    invalidResponseSP: '0002'
  },
  messages: {
    ok: 'OK',
    unauthorized: 'Org cannt blank',
    orgNotFound: 'Org not found',
    notFoundComment: 'body comment not found',
  },
};
