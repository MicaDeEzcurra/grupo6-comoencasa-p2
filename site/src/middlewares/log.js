//middleware a nivel apliacion!
//este middleware va a chequear si tengo los datos de la session almacenados en la variable locals.
function log (req, res, next) {
//session
    res.locals.user = false;
    if(req.session.user){
       res.locals.user = req.session.user
       return next()

//cookies
    } else if (req.cookies.email){
      //  const user = userModel.findBySomething(e => e.email == req.cookies.email);
       if(user){
          delete user.password
          req.session.user = user;
          res.locals.user = user;
          return next()
       }
    } else {
       return next();
    }
    

 }
 
 module.exports = log;