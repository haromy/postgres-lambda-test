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

    const dataComment = await comment.findAll({
      where: { orgId: dataOrg.id },
      attributes: ['id', 'description', 'createdAt'], 
      include: [
        {as: 'organization', model: org}
      ]
    });

    return response(httpStatus.ok, { code: httpStatus.ok, data: dataComment });
  } catch (err) {
    return response(httpStatus.internalServerError, {
      message: err.message,
      code: errorCodes.internalServerError,
    });
  }
}
