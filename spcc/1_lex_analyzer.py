import re

# Define the regular expression patterns for each token
patterns = [
    (r'[a-zA-Z_][a-zA-Z0-9_]*', 'IDENTIFIER'),
    (r'[0-9]+', 'NUMBER'),
    (r'\+', 'PLUS'),
    (r'-', 'MINUS'),
    (r'\*', 'MULTIPLY'),
    (r'/', 'DIVIDE'),
    (r'\(', 'LPAREN'),
    (r'\)', 'RPAREN'),
    (r'\{', 'LBRACE'),
    (r'\}', 'RBRACE'),
    (r';', 'SEMICOLON'),
]

def tokenize(code):
    # Combine all the regular expression patterns into a single pattern
    combined_pattern = '|'.join('(?P<{}>{})'.format(name, pattern) for pattern, name in patterns)

    # Tokenize the code
    tokens = []
    for match in re.finditer(combined_pattern, code):
        token_type = match.lastgroup
        token_value = match.group(token_type)
        tokens.append((token_type, token_value))

    return tokens

# Read the code from a file
filename = 'spcc\sample_program.c'
with open(filename, 'r') as file:
    code = file.read()

# Tokenize the code
tokens = tokenize(code)
print(tokens)
