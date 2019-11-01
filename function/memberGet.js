const Sequelize = require('../config/mysql_conn');
const { member, org } = require('../models')
const response = require('../libs/response');
const { httpStatus, messages, errorCodes } = require('../config/constant');

module.exports = async (event) => {
  try {
    const orgParam = event.pathParameters.org;
    const dataOrg = await org.findOne({ where: {name: orgParam} });
    if(!dataOrg) {
      return response(httpStatus.badRequest, { code: httpStatus.badRequest, message: messages.orgNotFound });
    }

    const dataComment = await member.findAll({
      where: { orgId: dataOrg.id },
      attributes: ['id', 'name', 'username', 'imageUri', 'followingCount', 'followerCount', 'createdAt'], 
      order: [ [ 'followerCount', 'DESC' ] ],
      include: [
        {as: 'organization', model: org}
      ]
    });

    return response(httpStatus.ok, { code: httpStatus.ok, members: dataComment });
  } catch (err) {
    return response(httpStatus.internalServerError, {
      message: err.message,
      code: errorCodes.internalServerError,
    });
  }
}
