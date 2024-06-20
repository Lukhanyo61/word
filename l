Here's a simple HTML, CSS, and JavaScript code to create a basic Tic Tac Toe game with instructions:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tic Tac Toe Game</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
        }
        h1 {
            margin-bottom: 10px;
        }
        .board {
            display: grid;
            grid-template-columns: repeat(3, 100px);
            grid-template-rows: repeat(3, 100px);
            gap: 5px;
        }
        .cell {
            width: 100px;
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #fff;
            border: 2px solid #000;
            font-size: 24px;
            cursor: pointer;
        }
        .cell:hover {
            background-color: #ddd;
        }
        .instructions {
            margin: 20px 0;
        }
        .winner {
            margin-top: 20px;
            font-size: 24px;
            color: green;
        }
    </style>
</head>
<body>
    <h1>Tic Tac Toe Game</h1>
    <div class="instructions">
        <p>Click on a cell to make a move. The first player is "X" and the second player is "O".</p>
        <p>The game ends when a player has three of their marks in a row, column, or diagonal, or when all cells are filled without a winner.</p>
    </div>
    <div class="board">
        <div class="cell" id="cell-0"></div>
        <div class="cell" id="cell-1"></div>
        <div class="cell" id="cell-2"></div>
        <div class="cell" id="cell-3"></div>
        <div class="cell" id="cell-4"></div>
        <div class="cell" id="cell-5"></div>
        <div class="cell" id="cell-6"></div>
        <div class="cell" id="cell-7"></div>
        <div class="cell" id="cell-8"></div>
    </div>
    <div class="winner" id="winner"></div>
    <script>
        const cells = document.querySelectorAll('.cell');
        const winnerText = document.getElementById('winner');
        let currentPlayer = 'X';
        let board = ['', '', '', '', '', '', '', '', ''];

        cells.forEach(cell => {
            cell.addEventListener('click', () => {
                const cellIndex = Array.from(cells).indexOf(cell);
                if (board[cellIndex] === '' && winnerText.textContent === '') {
                    board[cellIndex] = currentPlayer;
                    cell.textContent = currentPlayer;
                    if (checkWinner()) {
                        winnerText.textContent = `${currentPlayer} Wins!`;
                    } else if (board.every(cell => cell !== '')) {
                        winnerText.textContent = 'It\'s a Draw!';
                    } else {
                        currentPlayer = currentPlayer === 'X' ? 'O' : 'X';
                    }
                }
            });
        });

        function checkWinner() {
            const winningCombinations = [
                [0, 1, 2],
                [3, 4, 5],
                [6, 7, 8],
                [0, 3, 6],
                [1, 4, 7],
                [2, 5, 8],
                [0, 4, 8],
                [2, 4, 6]
            ];
            return winningCombinations.some(combination => {
                return combination.every(index => board[index] === currentPlayer);
            });
        }
    </script>
</body>
</html>
```

This code creates a basic Tic Tac Toe game with a 3x3 grid. Players take turns clicking on the cells to place their "X" or "O". The game checks for a winner or a draw and displays the result.
