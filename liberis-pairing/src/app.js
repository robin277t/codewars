const wordleStringComparator = (targetWord, attempt) => {
  let answerString = "";
  let checkerString = targetWord;

  for (let i = 0; i <= 4; i++) {
    if (targetWord[i] === attempt[i]) {
      answerString += "2";
      checkerString = checkerString.replace(attempt[i], "");
    } else if (
      targetWord.includes(attempt[i]) &&
      checkerString.includes(attempt[i])
    ) {
      checkerString = checkerString.replace(attempt[i], "");
      answerString += "1";
    } else {
      answerString += "0";
    }
  }
  return answerString;
};

module.exports = wordleStringComparator;
