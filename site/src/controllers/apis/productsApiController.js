const { Product , Category } = require('../../database/models');

const productsApiController = {
  
  index: (req, res) => {
     Product.findAll()
        .then((data) => {

            let apiResponse = null;

            if(data){
                apiResponse = {
                    meta: {
                        status: 200,
                        length: data.length,
                        url: req.originalUrl
                    },
                    data: data
                }

            } else{
                apiResponse = {
                    meta: {
                        status: 404
                    },
                    data: null
                }    
            };

            return res.json(apiResponse)
        })
        .catch(error => {
            let apiResponse = {
                meta: {
                    status: 404
                },
                data: null
            }

            return res.json(apiResponse)
        });
    },

    detail: (req, res) => {

        Product.findByPk(req.params.productId, {
                include: ['category', 'user']
            })
            .then((product) => {

                let apiResponse = null;
    
                if(product){
                    apiResponse = {
                        meta: {
                            status: 200,
                            length: product.length,
                            url: req.originalUrl
                        },
                        data: product
                    }
    
                } else{
                    apiResponse = {
                        meta: {
                            status: 404
                        },
                        data: null
                    }    
                };
    
                return res.json(apiResponse)
            })
            .catch(error => {
                let apiResponse = {
                    meta: {
                        status: 404
                    },
                    data: null
                }
    
                return res.json(apiResponse)
            });

    },

};

module.exports = productsApiController;