function authMiddleware(req, res, next){

   if (req.session.user) {
      return next();
   }

   return res.redirect('/users/login')
}

module.exports = authMiddleware;

{/* <ul class="right-navbar">
				<% if(userLoggedIn) { %>
				<li><a href="/profile/<%=user.id%>">Perfil <i class="far fa-user"></i></a></li>
				<li><a href="/logout">logout <i class="fas fa-sign-out-alt"></i></a></li>
				<% } else { %>
				<li><a href="/register">Creá tu cuenta <i class="far fa-address-card"></i></a></li>
				<li><a href="/login">Ingresá <i class="fas fa-sign-in-alt"></i></a></li>
				<% } %>
				<li><a href= */}