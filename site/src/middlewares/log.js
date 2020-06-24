//middleware a nivel apliacion!
//este middleware va a chequear si tengo los datos de la session almacenados en la variable locals.
function log (req, res, next) {
//session
    res.locals.user = false;
    if(req.session.user){
      //quiero que todas mis vistas tengan la info de session del usuario, entonces creo la variable locals (viene con el pack session), donde voy a almacenar esta info. la variable locals, me permite acceder a esta info desde la vista      
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