use context essentials2021
include image
include tables


#--------------Lister til tabell--------------#


var sirkeltabell = [list: ]
var pinnetabell = [list: ]
var trekktabell = [list: ]

var i = 1


#--------------Spillfelt--------------"

# Lager et spillfelt med usynlig rektangler for å holde alt på plass, plasserer pinnene på hver ende og i midten av minste rektangel.

JusteringBig = rectangle(540, 200, "solid", "transparent")
JusteringSpill = rectangle(380, 200, "solid", "transparent")
Stick = circle(10, "solid", "black")

Stick1 = overlay-align("left", "center", Stick, JusteringSpill)
Stick2 = overlay-align("center", "center", Stick, Stick1)
Stick3 = overlay-align("right", "center", Stick, Stick2)

Spillfelt = overlay-align("center", "center", Stick3, JusteringBig)

#--------------Variabler-------------#

# Lager variabler for sirklene og justerer dem ved bruk av rectangler rundt dem.

Disk1 = circle(50, "solid", "orange")
Disk2 = circle(40, "solid", "blue")
Disk3 = circle(30, "solid", "green")
Disk4 = circle(20, "solid", "red")

Justering1 = rectangle(180, 100, "solid", "transparent")
Justering2 = rectangle(180, 80, "solid", "transparent")
Justering3 = rectangle(180, 60, "solid", "transparent")
Justering4 = rectangle(180, 40, "solid", "transparent")

JustertDisk1 = overlay-align("center", "center", Disk1, Justering1)
JustertDisk2 = overlay-align("center", "center", Disk2, Justering2)
JustertDisk3 = overlay-align("center", "center", Disk3, Justering3)
JustertDisk4 = overlay-align("center", "center", Disk4, Justering4)

#---------------Start funksjon og variabler--------------#

# Setter opp posisjon varablene ved å bruke "var" for å vise at den kan forandres, så lager en funksjon for instruksjoner som heter "melding()". Til slutt er det en funksjon som tegner start posisjonen til spillet.


var posisjon1 = 1
var posisjon2 = 1
var posisjon3 = 1
var posisjon4 = 1


fun melding():
  block:
    posisjon1 := 1
    posisjon2 := 1
    posisjon3 := 1
    posisjon4 := 1
    
    print("For å spille, skriv inn steg(sirkel, pinne).")
    print("1 er den største sirkelen, mens 4 er den minste.")
    print("1 er den første pinnen, 2 er den midterste og 3 en den siste.")
    print("Et eksempel, steg(4, 3), plasserer minste sirkel i høyre pinne.")
    print("Skriv start() for å starte spillet, og restart() for å starte på nytt.")  
    "Om du vil se en tabell med alle dine trekk skriv tabell()."
  end
end

fun start():
  block: 
    underlay(sirkel1(1),
      underlay(sirkel2(1),
        underlay(sirkel3(1),
          (sirkel4(1))))) 
  end
end
    


#---------------Restart funksjon--------------#

# Starter spillet om igjen ved å sette variablene for posisjonene tilbake til start og så tegne det på nytt.


fun restart():
  block:
    posisjon1 := 1
    posisjon2 := 1
    posisjon3 := 1
    posisjon4 := 1
    
    sirkeltabell := [list: ]
    pinnetabell := [list: ]
    trekktabell := [list: ]

    i := 1
    
    
    underlay(sirkel1(1),
      underlay(sirkel2(1),
        underlay(sirkel3(1),
          (sirkel4(1)))))  
  end
end


#---------------Spillet--------------#

# Plasserer hver sirkel der den skal ved å bruke variabler og posisjon som parameter.


fun sirkel1(posisjon):
  if posisjon == 1:
    Plassering = underlay-align("left", "center", JustertDisk1, Spillfelt)
    Plassering
  else if posisjon == 2:
    Plassering = underlay-align("center", "center", JustertDisk1, Spillfelt)
    Plassering
  else if posisjon == 3: 
    Plassering = underlay-align("right", "center", JustertDisk1, Spillfelt)
    Plassering
  end
end

fun sirkel2(posisjon):
  if posisjon == 1:
    Plassering = underlay-align("left", "center", JustertDisk2, Spillfelt)
    Plassering
  else if posisjon == 2:
    Plassering = underlay-align("center", "center", JustertDisk2, Spillfelt)
    Plassering
  else if posisjon == 3: 
    Plassering = underlay-align("right", "center", JustertDisk2, Spillfelt)
    Plassering
  end
end

fun sirkel3(posisjon):
  if posisjon == 1:
    Plassering = underlay-align("left", "center", JustertDisk3, Spillfelt)
    Plassering
  else if posisjon == 2:
    Plassering = underlay-align("center", "center", JustertDisk3, Spillfelt)
    Plassering
  else if posisjon == 3: 
    Plassering = underlay-align("right", "center", JustertDisk3, Spillfelt)
    Plassering
  end
end
    
fun sirkel4(posisjon):
  if posisjon == 1:
    Plassering = underlay-align("left", "center", JustertDisk4, Spillfelt)
    Plassering
  else if posisjon == 2:
    Plassering = underlay-align("center", "center", JustertDisk4, Spillfelt)
    Plassering
  else if posisjon == 3: 
    Plassering = underlay-align("right", "center", JustertDisk4, Spillfelt)
    Plassering
  end
end


#---------------Funksjon for å tegne spillet--------------#

# Tegner spillet etter hvert steg som blir gjort og skjekker hver gang om spillet er fullført eller ikke ved å bruke en skjekk på posisjonene til sirkelene.


fun tegnalt():
  if (posisjon1 == 3) and (posisjon2 == 3) and (posisjon3 == 3) and (posisjon4 == 3):
    block:
      print("Du har vunnet. Bruk restart() for å starte på nytt")
      underlay(sirkel1(3),
        underlay(sirkel2(3),
          underlay(sirkel3(3),
            sirkel4(3))))
    end
  else:
  block:
    underlay(sirkel1(posisjon1),
      underlay(sirkel2(posisjon2),
        underlay(sirkel3(posisjon3),
          sirkel4(posisjon4))))
  end
end
end


#---------------Funksjon for å bevege sirkler--------------#

# Bruker en funksjon med parametere det samme som hvilken sirkel og hvilken pinne og skjekker deretter hvilken sirkel du tok inn ved if løkker og deretter oppdaterer posisjonen i tegnalt() funksjonen over til hvilken pinne den sirkelen skal flyttes til, samtidig som den også skjekker om trekket er ugyldig eller ikke.

fun steg(sirkel, stav):
  if sirkel == 1:
    block:
      if ((posisjon1 == posisjon2) or (posisjon1 == posisjon3) or (posisjon1 == posisjon4)) or ((posisjon2 == stav) or (posisjon3 == stav) or (posisjon4 == stav)):
        "ugyldig trekk"
      else:
        block:
          posisjon1 := stav
          pinnetall = [list: stav]
          sirkeltall = [list: sirkel]
          sirkeltabell := sirkeltabell.append(sirkeltall)
          pinnetabell := pinnetabell.append(pinnetall)
          trekkliste = [list: i]
          trekktabell := trekktabell.append(trekkliste)
          i := i + 1
          tegnalt()
        end
      end
    end
  else if sirkel == 2:
    block:
      if ((posisjon2 == posisjon3) or (posisjon2 == posisjon4)) or ((posisjon3 == stav) or (posisjon4 == stav)):
        "ugyldig trekk"
      else:
        block:
          posisjon2 := stav
          pinnetall = [list: stav]
          sirkeltall = [list: sirkel]
          sirkeltabell := sirkeltabell.append(sirkeltall)
          pinnetabell := pinnetabell.append(pinnetall)
          trekkliste = [list: i]
          trekktabell := trekktabell.append(trekkliste)
          i := i + 1
          tegnalt()
        end
      end
    end
  else if sirkel == 3:
    block:
      if (posisjon3 == posisjon4) or (posisjon4 == stav):
        "ugyldig trekk"
      else:
        block:
          posisjon3 := stav
          pinnetall = [list: stav]
          sirkeltall = [list: sirkel]
          sirkeltabell := sirkeltabell.append(sirkeltall)
          pinnetabell := pinnetabell.append(pinnetall)
          trekkliste = [list: i]
          trekktabell := trekktabell.append(trekkliste)
          i := i + 1
          tegnalt()
        end
      end
    end
  else if sirkel == 4:
    block:
      posisjon4 := stav
      pinnetall = [list: stav]
      sirkeltall = [list: sirkel]
      sirkeltabell := sirkeltabell.append(sirkeltall)
      pinnetabell := pinnetabell.append(pinnetall)
      trekkliste = [list: i]
      trekktabell := trekktabell.append(trekkliste)
      i := i + 1
      tegnalt()
    end
  else:
    "ugyldig input"
  end
end


#---------------Funksjon for å lage tabell--------------#


fun tabell():
  t = [table-from-columns:
    {"trekk"; trekktabell},
    {"sirkel"; sirkeltabell},
    {"pinne"; pinnetabell}
  ]
  t
end

#---------------Skriver ut første funksjonene når du trykker på run--------------#


melding()