use context essentials2021
include image

#--------------Spillfelt--------------"

JusteringBig = rectangle(540, 200, "solid", "transparent")
JusteringSpill = rectangle(380, 200, "solid", "transparent")
Stick = circle(10, "solid", "black")

Stick1 = overlay-align("left", "center", Stick, JusteringSpill)
Stick2 = overlay-align("center", "center", Stick, Stick1)
Stick3 = overlay-align("right", "center", Stick, Stick2)

Spillfelt = overlay-align("center", "center", Stick3, JusteringBig)

#--------------Variabler-------------#

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


fun restart():
  block:
    posisjon1 := 1
    posisjon2 := 1
    posisjon3 := 1
    posisjon4 := 1
    
    underlay(sirkel1(1),
      underlay(sirkel2(1),
         underlay(sirkel3(1),
          (sirkel4(1)))))    
  end
end


#---------------Spillet--------------#


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
# Tegner spillet etter hvert steg som blir gjort.


fun tegnalt():
  block:
    underlay(sirkel1(posisjon1),
      underlay(sirkel2(posisjon2),
        underlay(sirkel3(posisjon3),
          sirkel4(posisjon4))))
  end
end


fun steg(sirkel, stav):
  if sirkel == 1:
    block:
      if ((posisjon1 == posisjon2) or (posisjon1 == posisjon3) or (posisjon1 == posisjon4)) or ((posisjon2 == stav) or (posisjon3 == stav) or (posisjon4 == stav)):
        "ugyldig trekk"
      else:
        block:
          posisjon1 := stav
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
          tegnalt()
        end
      end
    end
  else if sirkel == 4:
    block:
      posisjon4 := stav
      tegnalt()
    end
  else:
    "ugyldig input"
  end
end

melding()















