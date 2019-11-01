const org = require('./org');
const comment = require('./comment');
const member = require('./member');

// associate org with comment
org.hasMany(comment, { as: 'comment', foreignKey: 'orgId' });
comment.belongsTo(org, {as: 'organization', foreignKey: 'orgId'});

// associate org with member
org.hasMany(member, { as: 'member', foreignKey: 'orgId' });
member.belongsTo(org, {as: 'organization', foreignKey: 'orgId'});

module.exports = {
  org,
  comment,
  member,
};
