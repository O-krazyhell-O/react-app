import { useState } from 'react';
import './App.css';

function App() {
  const [count, setCount] = useState(0);

  return (
    <div className="app">
      <h1>Счётчик кликов</h1>

      <p>Количество кликов: {count}</p>

      <button onClick={() => setCount(count + 1)}>
        Нажми меня
      </button>
    </div>
  );
}

export default App;