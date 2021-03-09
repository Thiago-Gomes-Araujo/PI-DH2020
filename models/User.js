module.exports = (sequelize, DataType) =>  {

    const User = sequelize.define(
      'User', 
    { 
        id: {
            type: DataType.INTEGER,
            primaryKey: true,
            autoIncrement: true,
          },
          name: {
            type: DataType.STRING,
            allowNull: false
          },
          email: DataType.STRING,
          password: DataType.STRING,
          createdAt: {
            type: DataType.DATE
          },
          updatedAt: {
            type: DataType.DATE
          },
        },
        {
            tableName: 'users'
        });

    return User;
}
