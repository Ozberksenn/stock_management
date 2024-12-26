const sql = require('../../db/db_connection')
const request = new sql.Request()

getMenu = async (req,res) => {
     try {
            let data = await request.execute('GETMENU')
            return res.json({
                'statusCode' : res.statusCode,
                'message': res.statusMessage,
                'data':data.recordset
            });  // Sonucu JSON formatında döndür
        } catch (error) {
           return res.json({ 'message': error});
        }
}

postMenu = async (req,res) => {
        try {
             await request.input('MENUNAME',req.body.MENUNAME)
            .input('MENUDESCRIPTION',req.body.MENUDESCRIPTION)
            .input('MENUIMAGE',req.body.MENUIMAGE)
            .execute('POSTMENU')
             return res.json({
                'statusCode' : res.statusCode,
                'message' : res.statusMessage,
            })
        } catch (error) {
           return  res.json({
                'message' : error
            })
        }
}

deleteMenu = async (req,res) => {
        try {
            await request.input('MENUID',req.body.MENUID).execute('DELETEMENU')
            return res.json({
                'statusCode' : res.statusCode,
                'message' : res.statusMessage,
            })
        } catch (error) {
            return res.json({
                'message' : error
            })
        }
}

updateMenu = async (req,res) => {
    try {
         let data = await request.input('MENUID',req.body.MENUID)
        .input('MENUNAME',req.body.MENUNAME)
        .input('MENUDESCRIPTION',req.body.MENUDESCRIPTION)
        .input('MENUIMAGE',req.body.MENUIMAGE)
        .execute('UPDATEMENU')
       return  res.json({
            'statusCode' : res.statusCode,
            'message' : res.statusMessage,
            'data': data.recordset
        })
    } catch (error) {
       return res.json({
            'message' : error
        })
    }
}

module.exports = {getMenu,postMenu,deleteMenu,updateMenu};

