var MongoClient = require('mongodb').MongoClient

MongoClient.connect("mongodb://twoHatUser:twoHatPass@localhost:27017/two_hat", (err, client) => {
	
	if (err) throw err

  	var db = client.db('two_hat')

  	db.collection('chat').aggregate([
		{
			$match: {
				filtered: {
					$ne: 0
				}
			},
		},
		{
			$group : {
				_id: '$player',
				count: {
					$sum: 1 
				}
			}
		},
		{ 
			$sort: { 
				count: -1 
			} 
		}
	]).toArray((err, docs) => {

		console.log(docs)

		client.close()
	})
})