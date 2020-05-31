function log(req, res, next) {
    res.locals.user = false;
    if (req.session.user) {
        res.locals.user = req.session.user
    }

    return next();
}

module.exports = log;