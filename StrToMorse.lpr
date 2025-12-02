{Rôle : Transforme une phrase en morse}
program StrToMorse;
{$codepage utf8}
{$mode objfpc}{$H+}

uses
  Classes, SysUtils, Windows, Crt;//Crt pour delay afin de mettre des intervalles


// ex : SOS -> "... _ _ _ ..." en son avec la fonction Beep qui vient de l'unit Windows

//on fait une procedure car on doit renvoyer plusieurs choses

var 

i : integer;//notre compteur de boucle dans le str
Phrase : string;//Variable stockant notre phrase qui va être traduite
continuer : boolean;//la valeur de vérité du souhait d'arrêt
choix : string;//chaine de caractère qui represente le choix pour continuer ou pas

const

frequence = 440;//fréquence du son émis en Hz
duree = 130;//duree d'un son en ms


//on fait des sous-programmes qui vont émettre les sons

procedure pt;//les points en morse 1unité de temps
  begin
  Beep(frequence, duree); //emet un son en fonction de la freq et duree déclaré dans les const
end;

procedure tr;// les traits en morse 3 unité de temps 
  begin
  Beep(frequence, duree * 3); //emet un son en fonction de la freq et duree déclaré dans les const
end;


begin

  continuer:=True;

  writeln('Ecrivez ici la phrase ou le mot à traduire en morse : ');

  readln(Phrase);


  
  while continuer do

    begin

    Phrase := upcase(Phrase); //on met la phrase en majuscule

    for i:=low(Phrase) to high(Phrase) do

      begin

        case Phrase[i] of //pour chaque cas on va émettre le son correspondant à la lettre en appelant la procedure correspondante autant de fois que l'on souhaite
        'A': begin
              pt; tr;
            end;
        'B': begin
              tr; pt; pt; pt;
            end;
        'C': begin
              tr; pt; tr; pt;
            end;
        'D': begin
              tr; pt; pt;
            end;
        'E': begin
              pt;
            end;
        'F': begin
              pt; pt; tr; pt;
            end;
        'G': begin
              tr; tr; pt;
            end;
        'H': begin
              pt; pt; pt; pt;
            end;
        'I': begin
              pt; pt;
            end;
        'J': begin
              pt; tr; tr; tr;
            end;
        'K': begin
              tr; pt; tr;
            end;
        'L': begin
              pt; tr; pt; pt;
            end;
        'M': begin
              tr; tr;
            end;
        'N': begin
              tr; pt;
            end;
        'O': begin
              tr; tr; tr;
            end;
        'P': begin
              pt; tr; tr; pt;
            end;
        'Q': begin
              tr; tr; pt; tr;
            end;
        'R': begin
              pt; tr; pt;
            end;
        'S': begin
              pt; pt; pt;
            end;
        'T': begin
              tr;
            end;
        'U': begin
              pt; pt; tr;
            end;
        'V': begin
              pt; pt; pt; tr;
            end;
        'W': begin
              pt; tr; tr;
            end;
        'X': begin
              tr; pt; pt; tr;
            end;
        'Y': begin
              tr; pt; tr; tr;
            end;
        'Z': begin
              tr; tr; pt; pt;
            end;

        end;//fin du case of

        Delay(duree*3);//on met un intervalle entre chaque lettre

        if Phrase[i]=' ' then Delay(duree*(7-3));//on met une intervalle plus grande entre chaque mot, séparé par des espaces

    end;//fin boucle pour

  Writeln;//saute une ligne 
  Writeln('Voulez-vous traduire une autre phrase ? ');
  Writeln;//saut de ligne
  Writeln('1/ Oui');
  Writeln('2/ Non');
  readln(choix);

  if choix='1' then
    begin
    Writeln('Entrez la nouvelle phrase : ');
    read(Phrase);
  end

  else
    continuer := False //on arrête la boucle dans ce cas

  end;//fin tant que
  
  
readln;//laisse le terminal ouvert

end.//Fin du programme