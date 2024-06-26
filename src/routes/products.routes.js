const express = require('express');
const router = express.Router();
const multer = require('multer')
const path = require('path')
const { detail, add, edit, update, create, allProducts, remove, filterCat} = require('../controllers/productsController');


const storage = multer.diskStorage({
  destination:(req,file,cb)=>{
      cb(null,(path.join(__dirname,"../","../","/public/images/productos")))
  },
  filename:(req,file,cb)=>{

      cb(null,`${Date.now()}_img_${path.extname(file.originalname)}`);
  }
});
const upload = multer({storage})


/* productos */
router
  .get('/allProducts', allProducts)
  .get('/detail/:id', detail)
  .get('/agregar', add)
  .get('/editar/:id', edit)
  .put('/editar/:id',upload.single('mainImage') , update)
  .post('/create',upload.single('mainImage'),create)
  .delete('/delete/:id', remove)
  .get('/category/:id', filterCat) 


module.exports = router