const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const session = require('express-session');

// ************ express() - (don't touch) ************
const app = express();

// ************ Middlewares - (don't touch) ************
app.use(session({
  secret: 'comoencasa',
  resave: false,
  saveUninitialized: true
}))


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, '../public')));

// ************ Template Engine - (don't touch) ************
app.set('views', path.join(__dirname, '/views'));
app.set('view engine', 'ejs');


// ************ WRITE YOUR CODE FROM HERE ************
// ************ Route System require and use() ************
const indexRouter = require('./routes/index');
const homeRouter = require('./routes/home');
const usersRouter = require('./routes/users');
const buscadorRouter = require('./routes/buscador');
const categoriaRouter = require('./routes/categoria');
const productoRouter = require('./routes/producto');
const guardadoRouter = require('./routes/guardado');
const carritoRouter = require('./routes/carrito');

app.use('/', indexRouter);
app.use('/home', homeRouter);
app.use('/users', usersRouter);
app.use('/buscador', buscadorRouter);
app.use('/categoria', categoriaRouter);
app.use('/producto', productoRouter);
app.use('/guardado', guardadoRouter);
app.use('/carrito', carritoRouter);



// ************ DON'T TOUCH FROM HERE ************
// ************ catch 404 and forward to error handler ************
app.use(function(req, res, next) {
  next(createError(404));
});

// ************ error handler ************
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});


// ************ exports app - dont'touch ************
module.exports = app;
