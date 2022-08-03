#!/bin/python

import os
import sys
import openai

openai.api_key = os.getenv("OPENAI_API_KEY")

response = openai.Completion.create(
  engine="text-davinci-002",
  prompt=" ".join(sys.argv[1:]) + "\n",
  temperature=0.7,
  max_tokens=256,
  top_p=1,
  frequency_penalty=0,
  presence_penalty=0
)

print(response, file=sys.stderr)
print(response["choices"][0]["text"])
