// Show all databases
show databases
admin                  42.00 KiB
config                 75.00 KiB
local                  98.00 KiB
school_management     390.00 KiB
test                   10.00 KiB
sk_college             30.00 KiB

// Switch to SK College database
use sk_college
switched to db sk_college

// Verify current database
db
sk_college

// Drop the SK College database
db.dropDatabase()
{ ok: 1, dropped: 'vit_college' }

// Create new SK database
use sk_university
switched to db sk_university

// Create collections
db.createCollection("SK_Students")
{ ok: 1 }

db.createCollection("SK_Results")
{ ok: 1 }

// Show collections
show collections
SK_Results
SK_Students

// Remove Results collection
db.SK_Results.drop()
true

// Insert student records
db.SK_Students.insertOne({
  name: 'SK Priya',
  address: 'Chennai',
  enrollment_date: new Date()
})
{
  acknowledged: true,
  insertedId: ObjectId('67d9ba98726d52f6470e5b77')
}

db.SK_Students.insertOne({
  name: 'SK Rahul',
  address: 'Bangalore',
  courses: ['Math', 'Science'],
  scholarship: true
})
{
  acknowledged: true,
  insertedId: ObjectId('67d9baa2726d52f6470e5b78')
}

// Query students
db.SK_Students.find()
{
  _id: ObjectId('67d9ba98726d52f6470e5b77'),
  name: 'SK Priya',
  address: 'Chennai',
  enrollment_date: ISODate("2024-03-20T00:00:00Z")
}
{
  _id: ObjectId('67d9baa2726d52f6470e5b78'),
  name: 'SK Rahul',
  address: 'Bangalore',
  courses: ['Math', 'Science'],
  scholarship: true
}

// Delete a student record
db.SK_Students.deleteOne({name: 'SK Priya'})
{ acknowledged: true, deletedCount: 1 }
