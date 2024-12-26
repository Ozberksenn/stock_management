const express = require('express');
const app = express();
const sql = require('./src/controller/menu/menu_controller')
const menuController = require('./src/controller/menu/menu_controller')
const logingController = require('./src/controller/login/login_controller')
const productsController = require('./src/controller/products/products_controller')
const notificationController = require('./src/controller/notification/notification_controller')
app.listen(8080,()=>{
    console.log('Port calisti')
})

app.use(express.json()); // bu satır çok önemli Express, gelen JSON verilerini doğru şekilde işlemek 
// için bir middleware kullanmalıdır. Eğer express.json() middleware'ini kullanmıyorsanız,
// req.body undefined olarak kalır.


// // swagger
// const swaggerJSDoc = require('swagger-jsdoc');
// const swaggerUi = require('swagger-ui-express');
// const swaggerOptions = {
//     definition: {
//       openapi: '3.0.0',
//       info: {
//         title: 'Node.js API',
//         version: '1.0.0',
//         description: 'Node.js API için Swagger Dokümantasyonu',
//       },
//     },
//     // Swagger dokümantasyonunun hangi dosyalarda olduğunu belirtin
//     apis: ['./routes/*.js'],  // API rotalarınızı buraya dahil edin
//   };
  
//   const swaggerSpec = swaggerJSDoc(swaggerOptions);
// app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

app.get('/',(req,res) => {
    res.json({
        'message': 'hoş geldiniz'
    })
})

// login
app.post('/login',logingController.loginCompany)
app.post('/createCompany',logingController.createCompany)
// products
app.get('/getProducts',productsController.getProducts)
app.post('/createProducts',productsController.createProduct)
app.put('/updateProduct',productsController.updateProduct)
app.delete('/deleteProduct',productsController.deleteProduct)
//bands
app.get('/getBands',productsController.getBands)
app.post('/postBand',productsController.postBand)
app.post('/deleteBand',productsController.deleteBand)
//notification
app.get('/getNotification',notificationController.getNotification)
// menu
app.get('/getMenu',menuController.getMenu)
app.post('/postMenu',menuController.postMenu)
app.delete('/deleteMenu',menuController.deleteMenu)
app.put('/updateMenu',menuController.updateMenu)