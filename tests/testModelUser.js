const { User } = require('../models');

// User.create({
//     name: "Marcelo",
//     email: "marcelo@gmail.com",
//     password: "1234"
// });

User.findAll().then(
    users => {
        console.log(users[0].toJSON());
        process.exit();
    }
)
