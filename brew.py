from random import randint

#our stack will just be a list- .append() = push, .pop() = pop!
variables = {}
stack = []
content = []
extract = ['pour', 'pull', 'filter', 'scoop', 'grind', 'brew', 
           '(|)', 'stir', 'price', 'lightRoast', 'darkRoast', 
           'makeLatte', 'roast', 'new']

 
#reads file 
def GetText(fileName) :
    #opens file with name of "sample.txt"
    file = open(fileName+".txt", "r")
    #reads the whole file at once 
    readFile = file.read()
    #returns a list, ie: ['pour', '1', '2', 'pull', '5', '2', ...etc]
    fileList = readFile.split();
    file.close()
    return fileList

#reads file for strings 
def lexer(filename):
    state = 0
    string = ""
    file = GetText(filename)
    for char in file:
        #looks for quotes at the beginning and end of a sentence or  word
        if char[0] == "\"" and char[len(char)-1]=="\"":
            content.append(char[1:len(char)-1])
        elif char[0] == "\"" or char[len(char)-1]=="\"":
            if state==0:
                #state is changed to 1 if quote found in the beginning
                state=1
                #string is set to the word without the quote
                string+=char[1:]
                #space is added
                string+= " "
            #quote is found and state ==1->quote is found at the end of string
            elif state==1:
                #the last word is added to string without quotes
                string+=char[:len(char)-1]
                #print(string)
                
                #adds string to content
                content.append(string)
                #string && state reset
                string = ""
                state = 0 
        #no quote found && state ==1 -> quoted string has not ended, so add char to string    
        elif state== 1:
            string += char
            string+=" "     
        #no quotes just add char
        else:
            content.append(char)
    return content
        
def Main():
    lexer("sample")
    print(content)
    #go through each word/item in the list
    index = 0
    while index < len(content):
        #print(content)
        item = content[index]
        #if it's equal to something in the dictionary, proceed
        if item in extract:
            if item == "pour":
                if IsNum(content[index+1]) and IsNum(content[index+2]):
                    sum = int(content[index+1]) + int(content[index+2])
                    print(content[index+1],"+",content[index+2],"=",sum)         
                else:
                    print("Error: you can only perform pull on numbers")
                index += 3
            
            elif item == "pull":
                if IsNum(content[index+1]) and IsNum(content[index+2]):
                    difference = int(content[index+1]) - int(content[index+2])
                    print(content[index+1],"-",content[index+2],"=",difference)
                else:
                    print("Error: you can only perform pull on numbers")
                index += 3
            
            elif(item == "filter"):
                if IsNum(content[index+1]) and IsNum(content[index+2]):
#                     stack.append(int(content[index+2]))
#                     stack.append(int(content[index+1]))
#                     quotient =  stack.pop()/stack.pop()
                    quotient = int(content[index+1]) / int(content[index+2])
                    print(content[index+1],"/",content[index+2],"=",quotient)
                else:
                    print("Error: you can only perform pull on numbers")
                index += 3    
                           
            elif(item == "scoop"):
                if IsInt(content[index+1]) and IsInt(content[index+2]):
                    remainder = int(content[index+1]) % int(content[index+2])
                    print(content[index+1],"%",content[index+2],"=",remainder)
                else:
                    print("Error: you can only perform pull on integers")
                index += 3
                
            elif(item == "grind"):
                if IsNum(content[index+1]) and IsNum(content[index+2]):
                    product = int(content[index+1]) * int(content[index+2])
                    print(content[index+1],"*",content[index+2],"=",product)
                else:
                    print("Error: you can only perform pull on numbers")
                index += 3
                    
            elif item == "brew":
                print(content[index+1])
                index += 2
            elif item == "(|)":
                # skip the first "(|)"
                index += 1
                # skip what's between the two "(|)"s
                while content[index] != "(|)":
                    index += 1
                    if index > 100:
                        print("Error: your comment is either over 100 words or you are missing the ending '(|)' ")
                # skip the last "(|)"
                index += 1
                
            elif item == "stir":
                if isinstance(content[index+1], str) and isinstance(content[index+2], str):
                    concat = content[index+1] + content[index+2]
                    print(concat)
                else:
                    print("Error: one or both of the values you are trying to concatenate is not a string")
                index += 3
            
            elif item == "makeLatte":
                if IsInt(content[index+1]):
                    fact = Factorial()
                    print(fact)
                else:
                    print("Error: you can only perform makeLatte on integers")
                index += 2
            
            elif item == "roast":
                if IsInt(content[index+1]) and IsInt(content[index+2]):
                    rand = randint(content[index+1], content[index+2])
                    print("random number is: "+rand)
                else:
                    print("Error: you can only perform roast on integers")
                index += 3
                
            elif item == "(|)":
                # skip the first "(|)"
                index += 1
                # skip what's between the two "(|)"s
                while content[index] != "(|)":
                    index += 1
                    if index > 100:
                        print("Error: your comment is either over 100 words or you are missing the ending '(|)' ")
                # skip the last "(|)"
                index += 1
                
            elif item == "stir":
                if isinstance(content[index+1], str) and isinstance(content[index+2], str):
                    concat = content[index+1] + content[index+2]
                    print(concat)
                else:
                    print("Error: one or both of the values you are trying to concatenate is not a string")
                index += 3
            
            elif item == "makeLatte":
                if IsInt(content[index+1]):
                    fact = Factorial()
                    print(fact)
                else:
                    print("Error: you can only perform makeLatte on integers")
                index += 2
            
            elif item == "roast":
                if IsInt(content[index+1]) and IsInt(content[index+2]):
                    rand = randint(content[index+1], content[index+2])
                    print("random number is: "+rand)
                else:
                    print("Error: you can only perform roast on integers")
                index += 3
            
            elif item == "new":
                varName = content[index+1]
                # set the pattern (aka specifies what the variable name can and cannot be)
                pattern = re.compile("[a-zA-Z]+[0-9_]*[a-zA-Z0-9]+")
                # looks for a match
                match = pattern.search(varName)
                # if the match = varName AND it's not a function name, then it's a valid variable name
                if match.group(0) == varName and varName not in extract:
                    validValue = False
                    if isinstance(content[index+2], str) or IsNum(content[index+2]):
                        varValue = content[index+2]
                        validValue = True
                        index += 3
                    elif content[index+2] in variables:
                        varValue = variables[content[index+2]]
                        validValue = True
                        index += 3
                    if validValue == True:
                        variables[str(varName)] = str(varValue)
                    else:
                        print("Error: invalid variable value")
                else:
                    print("Error: invalid variable name")
        
        #else, return error: "Error: *word* is not a valid function call."
        else: 
            print("Error: "+item+" is not a valid function call.")
            index += 1
        
        
        
def Factorial(num):
    if num == 0:
        return 1
    else:
        return num * Factorial(num-1)
    
def IsInt(num):
    try:
        num = float(num)
        return num.is_integer()
    except:
        return False
def IsNum(num):
    try:
        num = float(num)
        #if num can be converted to float then true!
        return True
    except:
        return False
    


Main()