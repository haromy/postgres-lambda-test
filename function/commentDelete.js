const Sequelize = require('../config/mysql_conn');
const { comment, org } = require('../models')
const response = require('../libs/response');
const { httpStatus, messages, errorCodes } = require('../config/constant');

module.exports = async (event) => {
  try {
    const orgParam = event.pathParameters.org;
    const dataOrg = await org.findOne({ where: {name: orgParam} });
    if(!dataOrg) {
      return response(httpStatus.badRequest, { code: httpStatus.badRequest, message: messages.orgNotFound });
    }

    const dataComment = await comment.destroy({
      where: {
        orgId: dataOrg.id
      }
  })

    return response(httpStatus.ok, { code: httpStatus.ok, total_deleted: dataComment });
  } catch (err) {
    return response(httpStatus.internalServerError, {
      message: err.message,
      code: errorCodes.internalServerError,
    });
  }
}
