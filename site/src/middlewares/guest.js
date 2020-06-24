 function guestMiddleware(req, res, next){

   if (req.session.user == undefined) { //si no existe la session de ese usuario, procede con register. sino lo lleva a index
      return next();

   } else {

      return res.redirect('/')
   }


}

module.exports = guestMiddleware;


// module.exports = (req, res, next) => {

//     if(!req.session.user){
//        return next();
//     }
    
//     return res.redirect('/')
//  }