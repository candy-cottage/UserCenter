import { Routes, Route } from 'react-router-dom'

function HomePage() {
  return (
    <div className="flex min-h-screen items-center justify-center">
      <div className="text-center">
        <h1 className="text-4xl font-bold text-gray-800">用户中心</h1>
        <p className="mt-4 text-lg text-gray-500">UserCenter Management System</p>
      </div>
    </div>
  )
}

function App() {
  return (
    <Routes>
      <Route path="/" element={<HomePage />} />
    </Routes>
  )
}

export default App
