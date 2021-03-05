var express = require('express');
var router = express.Router();
const SignInController = require("../controller/SignInController");

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.get('/signin', SignInController.signin);

module.exports = router;



