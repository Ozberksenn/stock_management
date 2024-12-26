const sql = require('../../db/db_connection')
const request = new sql.Request()



loginCompany = async (req,res) => {
    try {
    let result =  await request.input('MAIL',req.body.MAIL).input('PASSWORD',req.body.PASSWORD).execute('COMPANYLOGIN')
        return res.json({
            'statusCode' : res.statusCode,
            'message': res.statusMessage,
            'data':result.recordset[0]
        });
    } catch (error) {
        return res.json({
            'message': error
        });
    }
}

createCompany = async (req,res) => {
    try {
        let result =  await request.input('COMPANYNAME',req.body.COMPANYNAME)
        .input('MAIL',req.body.MAIL)
        .input('PASSWORD',req.body.PASSWORD)
        .input('PHONE',req.body.PHONE)
        .input('LOGO',req.body.LOGO)
        .input('BANNER',req.body.BANNER)
        .execute('CREATECOMPANY')
        return res.json({
            'statusCode' : res.statusCode,
            'message': res.statusMessage,
            'data':result.recordset[0]
        });
    } catch (error) {
        return res.json({
            'message': error
        });
    }
}

module.exports = {loginCompany,createCompany}
