
const cds = require('@sap/cds')
module.exports = cds.service.impl (function(){
  this.after ('READ','Sales', each => {each.Z_totalAmountWeight = 100; console.log(req)})
})