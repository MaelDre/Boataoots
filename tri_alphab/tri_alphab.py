#!/usr/bin/env python

import sys

FILENAME=sys.argv[1]

# Ouvrir le fichier en lecture seule
file = open(FILENAME, "r")

# Lire tout le fichier et le mettre dans une liste
my_list = []
for line in file:
    print(line)
    my_list.append(line)
file.close()

# Trier cette liste pr ordre alphabétique
my_list.sort()

# Créer un fichier résultat 
file_res = open("res_" + file.name, "w+")

# Ecrire la liste dans le fichier
for item in my_list:
    file_res.write("%s\n" % item)

file_res.close()
print ('tri_alphab DONE')
