const Sequelize = require('../config/mysql_conn');
const { comment, org } = require('../models')
const response = require('../libs/response');
const { httpStatus, messages, errorCodes } = require('../config/constant');

module.exports = async (event) => {
  const t = await Sequelize.initConnection.transaction();
  try {
    const orgParam = event.pathParameters.org;
    const dataOrg = await org.findOne({ where: {name: orgParam} });
    
    if(!dataOrg) {
      return response(httpStatus.badRequest, { code: httpStatus.badRequest, message: messages.orgNotFound });
    }

    var param = JSON.parse(event.body);

    if(!param.comment) {
      return response(httpStatus.badRequest, { code: httpStatus.badRequest, message: messages.notFoundComment });
    }

    const data = await comment.create({ description: param.comment, orgId: dataOrg.id }, { transactions: t });
    await t.commit();
    return response(httpStatus.ok, { code: httpStatus.ok, data });
  } catch (err) {
    await t.rollback();
    return response(httpStatus.internalServerError, {
      message: err.message,
      code: errorCodes.internalServerError,
    });
  }
}
