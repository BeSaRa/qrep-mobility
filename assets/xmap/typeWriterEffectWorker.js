let index = 0;

function typeWriterEffect(text) {
  if (index < text.length) {
    postMessage(text[index]);
    index++;
    const timeout = Math.floor(Math.random() * (30 - 10 + 1)); // provide a dynamic timeout value to provide effective typing feeling
    setTimeout(() => typeWriterEffect(text), timeout); // Adjust the interval to control the speed of typing
  }
}

onmessage = (event) => {
  const text = event.data;
  typeWriterEffect(text);
};
