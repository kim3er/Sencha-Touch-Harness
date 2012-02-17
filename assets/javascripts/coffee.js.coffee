//= require sencha-touch
//= require touch-charts

window.generateData = (n, floor) ->
  data = []
  p = (Math.random() * 11) + 1

  floor = if (!floor and floor isnt 0) then 20 else floor

  generate = (idx) ->
    data.push
        name: Date.monthNames[idx % 12]
        data1: Math.floor(Math.max((Math.random() * 100), floor))
        data2: Math.floor(Math.max((Math.random() * 100), floor))
        data3: Math.floor(Math.max((Math.random() * 100), floor))
        data4: Math.floor(Math.max((Math.random() * 100), floor))
        data5: Math.floor(Math.max((Math.random() * 100), floor))
        data6: Math.floor(Math.max((Math.random() * 100), floor))
        data7: Math.floor(Math.max((Math.random() * 100), floor))
        data8: Math.floor(Math.max((Math.random() * 100), floor))
        data9: Math.floor(Math.max((Math.random() * 100), floor))

  generate num for num in [0..n]
    
  data

window.store1 = new Ext.data.JsonStore
  fields: ['name', 'data1', 'data2', 'data3', 'data4', 'data5', 'data6', 'data7', 'data9', 'data9']
  data: generateData 5, 20
