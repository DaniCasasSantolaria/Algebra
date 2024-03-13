int punctuation = 0;
void Punctuation(){
  fill(#3344DB);
  textSize(20);
  if(punctuation < 100) text("Punctuation:" + nf(punctuation, 2), 90, 40);
  else if(punctuation < 1000) text("Punctuation:" + nf(punctuation, 3), 90, 40);
  else if(punctuation < 10000) text("Punctuation:" + nf(punctuation, 4), 90, 40);
}
