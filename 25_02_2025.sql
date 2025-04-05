// Working with University database
use university_db
switched to db university_db

// Create Students collection
db.createCollection("Students")
{ ok: 1 }

// Insert student records
db.Students.insertMany([
  { 
    student_id: "ST101",
    full_name: "Priya Sharma",
    address: "Chennai",
    courses: ["Computer Science", "Mathematics"],
    enrollment_date: new Date()
  },
  {
    student_id: "ST102",
    full_name: "Rahul Verma",
    address: "Bangalore",
    scholarship: true
  }
])
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('67d9d1014528fa06b04ca58c'),
    '1': ObjectId('67d9d1014528fa06b04ca58d')
  }
}

// View all students
db.Students.find().pretty()
{
  _id: ObjectId('67d9d1014528fa06b04ca58c'),
  student_id: 'ST101',
  full_name: 'Priya Sharma',
  address: 'Chennai',
  courses: ['Computer Science', 'Mathematics'],
  enrollment_date: ISODate("2024-03-20T00:00:00Z")
}
{
  _id: ObjectId('67d9d1014528fa06b04ca58d'),
  student_id: 'ST102',
  full_name: 'Rahul Verma',
  address: 'Bangalore',
  scholarship: true
}

// Update student record
db.Students.updateOne(
  { student_id: "ST101" },
  { $set: { full_name: "Priya K. Sharma" } }
)
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

// Create Books collection
db.createCollection("LibraryBooks")
{ ok: 1 }

// Insert books
db.LibraryBooks.insertMany([
  {
    title: "Database Systems",
    author: "Raghu Ramakrishnan",
    isbn: "978-0-4696-7030-4",
    available: true
  },
  {
    title: "NoSQL for Beginners",
    author: "Dan Sullivan",
    isbn: "978-0-4086-6859-8",
    available: false
  }
])
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('67d9d2014528fa06b04ca58e'),
    '1': ObjectId('67d9d2014528fa06b04ca58f')
  }
}

// Find available books
db.LibraryBooks.find({ available: true }).pretty()
{
  _id: ObjectId('67d9d2014528fa06b04ca58e'),
  title: 'Database Systems',
  author: 'Raghu Ramakrishnan',
  isbn: '978-0-4696-7030-4',
  available: true
}

// Cleanup collections
db.Students.drop()
true
db.LibraryBooks.drop()
true
