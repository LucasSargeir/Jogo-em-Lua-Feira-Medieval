require"Personagem"  -- 1- frente/ 2- costas/ 3- direita/ 4- esquerda     43x77   8x6
require"Aliado"
require"Enemy"
require"Barracas"
require"Dialogo"
local G1 = love.graphics.newImage("GAME SPRITES/tileset/G.png")
local R1 = love.graphics.newImage("GAME SPRITES/tileset/R.png")
local P1 = love.graphics.newImage("GAME SPRITES/tileset/P.png")
local A1 = love.graphics.newImage("GAME SPRITES/tileset/A.png")
local M1 = love.graphics.newImage("GAME SPRITES/tileset/M.png")
local N1 = love.graphics.newImage("GAME SPRITES/tileset/N.png")
local B1 = love.graphics.newImage("GAME SPRITES/tileset/B.png")
local C1 = love.graphics.newImage("GAME SPRITES/tileset/C.png")
local D1 = love.graphics.newImage("GAME SPRITES/tileset/D.png")
local E1 = love.graphics.newImage("GAME SPRITES/tileset/E.png")
local F1 = love.graphics.newImage("GAME SPRITES/tileset/F.png")
local H1 = love.graphics.newImage("GAME SPRITES/tileset/H.png")
local I1 = love.graphics.newImage("GAME SPRITES/tileset/I.png")
local J1 = love.graphics.newImage("GAME SPRITES/tileset/J.png")
local K1 = love.graphics.newImage("GAME SPRITES/tileset/K.png")
local L1 = love.graphics.newImage("GAME SPRITES/tileset/L.png")
local a2 = love.graphics.newImage("GAME SPRITES/tileset/2.png")
local a11 = love.graphics.newImage("GAME SPRITES/tileset/1.png")
local O1 = love.graphics.newImage("GAME SPRITES/tileset/O.png")
local P1 = love.graphics.newImage("GAME SPRITES/tileset/P.png")
local Q1 = love.graphics.newImage("GAME SPRITES/tileset/Q.png")
local S1 = love.graphics.newImage("GAME SPRITES/tileset/S.png")
local t1 = love.graphics.newImage("GAME SPRITES/tileset/t.png")
local U1 = love.graphics.newImage("GAME SPRITES/tileset/U.png")
local V1 = love.graphics.newImage("GAME SPRITES/tileset/V.png")
local W1 = love.graphics.newImage("GAME SPRITES/tileset/W.png")
local X1 = love.graphics.newImage("GAME SPRITES/tileset/X.png")
local Y1 = love.graphics.newImage("GAME SPRITES/tileset/Y.png")
local Z1 = love.graphics.newImage("GAME SPRITES/tileset/Z.png")
local a3 = love.graphics.newImage("GAME SPRITES/tileset/3.png")
--local a4 = love.graphics.newImage("GAME SPRITES/tileset/4.png")
local a5 = love.graphics.newImage("GAME SPRITES/tileset/5.png")
local a6 = love.graphics.newImage("GAME SPRITES/tileset/6.png")
local a7 = love.graphics.newImage("GAME SPRITES/tileset/7.png")
local a8 = love.graphics.newImage("GAME SPRITES/tileset/8.png")
local a9 = love.graphics.newImage("GAME SPRITES/tileset/9.png")
local Aliados = {}
local personagem_anim_frame = 1
local mapa = {}
local mapX = 0
local mapY = 0
local mapI = 9 --450
local mapJ = 1 --0
local tempoFantasia = 0
local direcaoMov = 3
local vel_mapa = 3
local vel_frame_personagem = 10
local tam_font = 40
local tela = 0 -- /0 = tela de inicio /1 = mapa / 2 = tela de batalha
local enemy = {}
local party = {}
local menu1 = false
local partyBodyCount=0
local bodyCount=0
local vezParty = true
local printar= false
local aux=0
local posicaoP=1
local posicaoE=1
local menu= false
local alvoMarker= false
local menu2 = false
local enemyTarget=1
local aux2=0
local k=1
local delivered=true
local attackSucess=false
local alvoMarkerHeal=false
local healTarget=1
local HEAL=false
local chargeUP=1
local powerUP=0
local escrevePowerUP=false
local initialD=false
local healthMenu=false
local vet_barracas = {}
local dir_anda = 0
local the_Viking 
local timer=0
local pos= 1 
local vetDialogo = {}
local final = 11  ------ numero de falas do inicio
local troca=0
local entraBatalha = 0
local xt = -800
local yt = -800
local velT = 10
local contT = 0
local jaBatalhou = false
local acaba = 0
local numObjetos = 20
local pegouEspada = false
local volteDepois = 0
local vd = 0
local dialogoPegaEspadas = 0
local tempoVar = 0
local vel_menu =10
local tocagadodefome = love.graphics.newImage("GAME SPRITES/Characters/Menus/IntroFresquinha.png")
local umasentada = love.graphics.newImage("GAME SPRITES/Characters/Menus/SwordIcon.png")
local minecraft_p = love.graphics.newFont("Minercraftory.ttf",15)
local minecraft_m = love.graphics.newFont("Minercraftory.ttf",40)
local outra_font_p = love.graphics.newFont("FSEX300.ttf",20)
local caixaDialogo = {}
local tempoDialogoEspadas = 9000
local vceraleo = love.graphics.newImage("GAME SPRITES/Characters/Menus/BATTLESCREENVAZIA.png")
function inicializaCaixaDialogos()
  caixaDialogo["Leo"] = love.graphics.newImage("GAME SPRITES/Characters/Menus/DialogoLeo.png")
  caixaDialogo["Scherpel"] = love.graphics.newImage("GAME SPRITES/Characters/Menus/DialogoScherpel.png")
  caixaDialogo["Luis"] = love.graphics.newImage("GAME SPRITES/Characters/Menus/DialogoLuis.png")
  caixaDialogo["Sargeiro"] = love.graphics.newImage("GAME SPRITES/Characters/Menus/DialogoSargeiro.png")
  caixaDialogo["Vazio"] = love.graphics.newImage("GAME SPRITES/Characters/Menus/DialogoVazio.png")
  caixaDialogo["Viking"] = love.graphics.newImage("GAME SPRITES/Characters/Menus/DialogoViking.png")
  caixaDialogo["Ferreiro"] = love.graphics.newImage("GAME SPRITES/Characters/Menus/DialogoFerreiro.png")
end
function escolheAlvoHeal()
     if healthMenu== true then
     alvoMarkerHeal=true  
   if healTarget==1  then
      if party[1]:IsNocaute() == false then
        if love.keyboard.isDown("up")and aux2>25 and healthMenu ==true then
          healTarget=4
          
          aux2=0
        end
          
        if love.keyboard.isDown("space") and aux2>=25 and healthMenu ==true then
          aux2=0
          aux=0
          checaDano(false,healTarget)
          healthMenu=false
          
          end
        if love.keyboard.isDown("down") and aux2>=25 and healthMenu ==true then
          
            healTarget=2
            aux2=0
            aux=0
          end
      else
        healTarget=2
      end
    end
    if healTarget==2  then
      if party[2]:IsNocaute() == false then
              
        if love.keyboard.isDown("down")and aux2>25 and healthMenu ==true then
          
            healTarget=3
           
           aux2=0
        end
        if love.keyboard.isDown("up")and aux2>25 and healthMenu ==true then
          healTarget=1
          
           aux2=0
          end
          if love.keyboard.isDown("space") and aux2>=25 and healthMenu ==true then
          aux2=0
          aux=0
          checaDano(false,healTarget)
          healthMenu=false
          end
      else
        healTarget=3
      end
    end
    if healTarget==3  then
      if party[3]:IsNocaute() == false then
        alvoMarkerHeal=true       
        if love.keyboard.isDown("down")and aux2>25 and healthMenu ==true then
          healTarget=4
          
           aux2=0
        end
        if love.keyboard.isDown("up")and aux2>25 and healthMenu ==true then
          healTarget=2
          
           aux2=0
          end
          if love.keyboard.isDown("space") and aux2>=25 and healthMenu ==true then
          aux2=0
          aux=0
          checaDano(false,healTarget)
          healthMenu=false
          end
      else
        healTarget=4
      end
    end
    if healTarget==4  then
      if party[4]:IsNocaute() == false then
        alvoMarkerHeal=true       
        if love.keyboard.isDown("up")and aux2>25 and healthMenu ==true then
          healTarget=3
          
          aux2=0
        end
         if love.keyboard.isDown("down")and aux2>25 and healthMenu ==true then
          healTarget=1
          
           aux2=0
        end
        if love.keyboard.isDown("space") and aux2>=25 and healthMenu ==true then
          aux2=0
          aux=0
          checaDano(false,healTarget)
          healthMenu=false
          end
      else
        healTarget=1
      end
    end
  end
  
  end
function checaDano(time,target)
    if aux2==0 and vezParty==false then
      if time==true then
        math.randomseed( os.time() )
        target=math.random(1,4)
        if party[target]:IsNocaute() == false then
          party[target]:SetHP(party[target]:GetHP()-30*chargeUP)
         else
           chargeUP=chargeUP+0.1
           initialD=true
           powerUP=0
           powerUPIS()
         end
         
      end
    end
    
    if aux2==0 and menu2 == true or healthMenu==true then
      alvoMarker=false 
      alvoMarkerHeal=false  
     if  time==false then
       
        if attackType==1 then
          enemy[target]:SetHP(enemy[target]:GetHP()-20)
         
          delivered=true
          attackSucess=true
          
        end
        if attackType==2 then
           enemy[target]:SetHP(enemy[target]:GetHP()-25)
           delivered=true
           attackSucess=true
        end
         if attackType==4 then
           party[target]:SetHP(party[target]:GetHP()+20)
           delivered=true
           attackSucess=true
           if party[target]:GetHP() >= party[target]:GetHPT() then
             party[target]:SetHP(party[target]:GetHPT())
             end
          
        end
        if attackType==3 then
          teste=true
          delivered=true
          attackSucess=true
        end
      end
    end
  end
function escolheAlvo()
  if menu2== true then
    alvoMarker=true  
    if enemyTarget==1  then
      if enemy[1]:IsNocaute()== false then
        if love.keyboard.isDown("up")and aux2>25 and menu2 ==true then
          enemyTarget=4
          
          aux2=0
        end
          
        if love.keyboard.isDown("space") and aux2>=25 and menu2 ==true then
          aux2=0
          aux=0
          checaDano(false,enemyTarget)
          menu2=false
          
          end
        if love.keyboard.isDown("down") and aux2>=25 and menu2 ==true then
          
            enemyTarget=2
            aux2=0
            aux=0
          end
      else
        enemyTarget=2
      end
    end
    if enemyTarget==2  then
      if enemy[2]:IsNocaute() == false then
        if love.keyboard.isDown("down")and aux2>25 and menu2 ==true then
          enemyTarget=3
          aux2=0
        end
        if love.keyboard.isDown("up")and aux2>25 and menu2 ==true then
          enemyTarget=1
          aux2=0
        end
        if love.keyboard.isDown("space") and aux2>=25 and menu2 ==true then
          aux2=0
          aux=0
          checaDano(false,enemyTarget)
          menu2=false
        end
    else
        enemyTarget=3
      end
    end
    if enemyTarget==3  then
      if enemy[3]:IsNocaute() == false then
        alvoMarker=true       
        if love.keyboard.isDown("down")and aux2>25 and menu2 ==true then
          enemyTarget=4
          aux2=0
        end
        if love.keyboard.isDown("up")and aux2>25 and menu2 ==true then
          enemyTarget=2
          aux2=0
        end
        if love.keyboard.isDown("space") and aux2>=25 and menu2 ==true then
          aux2=0
          aux=0
          checaDano(false,enemyTarget)
          menu2=false
        end
      else
        enemyTarget=4
      end
    end
    if enemyTarget==4  then
      if enemy[4]:IsNocaute()== false then
        alvoMarker=true       
        if love.keyboard.isDown("up")and aux2>25 and menu2 ==true then
          enemyTarget=3
          
          aux2=0
        end
         if love.keyboard.isDown("down")and aux2>25 and menu2 ==true then
          enemyTarget=1
          
           aux2=0
        end
        if love.keyboard.isDown("space") and aux2>=25 and menu2 ==true then
          aux2=0
          aux=0
          checaDano(false,enemyTarget)
          menu2=false
          end
      else
        enemyTarget=1
      end
    end
  end
end
function AI()
  aux=aux+1
 
  if aux>30 then
    aux2=0
    checaDano(true,1)
    enemy[posicaoE]:SetTurno(false)
    aux=0
    if posicaoE==4 then
      posicaoE = 1
      vezParty = true
    else
      posicaoE=posicaoE+1
    end
  end
end
function powerUPIS()
  if initialD==true then
    powerUP=powerUP+1
    if powerUP>=0 and powerUP<=50 then
      escrevePowerUP=true
    else
      escrevePowerUP=false
      initialD=false
    end
  end
end  
function loadMap(filename)
  local file = io.open(filename)
  local i = 1
  for line in file: lines() do
    mapa[i] = {}
    for j = 1 ,#line, 1 do
      mapa[i][j] = line:sub(j,j)
    end
    i = i + 1
  end
  file:close()
end
function escolheMovimento()
   if menu==false then
     marca=1
     end
   menu=true
   
    if marca==1 then 
     if love.keyboard.isDown("down")and aux>= vel_menu and menu2==false and healthMenu==false then
      marca=3
      aux=0
     end
     if love.keyboard.isDown("right")and aux>= vel_menu and menu2==false and healthMenu==false then
      marca=2
      aux=0
     end
     if love.keyboard.isDown("space") and aux>= vel_menu and menu2==false and healthMenu==false then
       aux2=0
       attackType=1
       menu2=true
       escolheAlvo()
       menu=false
       
     end
    end
    if marca==2 then 
     if love.keyboard.isDown("down")and aux>= vel_menu and menu2==false and healthMenu==false then
      marca=4
      aux=0
     end
     if love.keyboard.isDown("left")and aux>= vel_menu and menu2==false and healthMenu==false then
      marca=1
      aux=0
     end
     if love.keyboard.isDown("space") and aux>= vel_menu and menu2==false and healthMenu==false then
        aux2=0
       attackType=2
       menu2=true
       escolheAlvo()
       
     end
    end
    if marca==3 then 
     if love.keyboard.isDown("up")and aux>= vel_menu and menu2==false and healthMenu==false then
      marca=1
      aux=0
      
     end
     if love.keyboard.isDown("right")and aux>= vel_menu and menu2==false and healthMenu==false then
      marca=4
      aux=0
     end
     if love.keyboard.isDown("space")and  aux>= vel_menu and menu2==false and healthMenu==false then
       aux2=0
       aux=0
       attackType=3
       menu=false
       delivered=true
       attackSucess=true
       
     end
    end
    if marca==4 then 
     if love.keyboard.isDown("up")and aux>= vel_menu and menu2==false and healthMenu==false then
      marca=2
      aux=0
     end
     if love.keyboard.isDown("left")and aux>= vel_menu and menu2==false and healthMenu==false then
      marca=3
      aux=0
     end
     if love.keyboard.isDown("space") and aux>= vel_menu and menu2==false and healthMenu==false then
       aux2=0
       attackType=4
       healthMenu=true
       escolheAlvoHeal()
     end
    end
   end
function Sargeiro()
  local imagem = {}
  local frente = {}
  local costas = {}
  local direita = {}
  local esquerda = {}
  for i = 1, 8, 1 do
    frente[i] =love.graphics.newImage("GAME SPRITES/Characters/SargeiroLucas/SargeiroLucasWalk/Front/SargeiroWalkFront"..i..".png") 
    costas[i] =love.graphics.newImage("GAME SPRITES/Characters/SargeiroLucas/SargeiroLucasWalk/Back/SargeiroWalkBack"..i..".png")
    esquerda[i] =love.graphics.newImage("GAME SPRITES/Characters/SargeiroLucas/SargeiroLucasWalk/Left/SargeiroWalkLeft"..i..".png")
    direita[i] =love.graphics.newImage("GAME SPRITES/Characters/SargeiroLucas/SargeiroLucasWalk/Right/SargeiroWalkRight"..i..".png")
  end
  local batalha = {}
  
  batalha[1] =  love.graphics.newImage("GAME SPRITES/Characters/SargeiroLucas/LucasSword.png")
  
  imagem[1] = frente
  imagem[2] = costas
  imagem[3] = direita
  imagem[4] = esquerda
  imagem[5] = batalha
  
  party[1] = Personagem:new(imagem,360,300,32,74,115)
    
end
function Aliados()
  scherpel =love.graphics.newImage("GAME SPRITES/Characters/Scherpel/ScherpelSword.png") 
  luis = love.graphics.newImage("GAME SPRITES/Characters/Luis/LuisSword.png")
  leosin = love.graphics.newImage("GAME SPRITES/Characters/Leo/LeoSword.png")
  
  party[2] = Aliado:new("Scherpel",scherpel,0,0,32,74,125)
  party[3] = Aliado:new("Luis",luis,0,0,32,74,125)
  party[4] = Aliado:new("Leosin",leosin,0,0,32,74,93)
  
end
function Vikings()
  
  for i = 1, 4,1 do
    viking =love.graphics.newImage("GAME SPRITES/Characters/NPCs/Viking/Viking"..i.."Axe.png") 
    enemy[i] = Enemy:new("Viking 0"..i,viking,730,0,32,74,100)
  end
end
function love.load()
  Sargeiro()
  Aliados()
  Vikings()
 -- inicializaDialogo()
  inicializaCaixaDialogos()
  CriaBarracas()
  font = love.graphics.newFont("FSEX300.ttf",tam_font)
  love.graphics.setFont(font)
  loadMap("/mnt/sdb3/Jogo em Lua - Feira Medieval/map.txt")
end
function printaMapa()
  for i = 0, 13, 1 do
    for j = 0, 17, 1 do
       if (mapI - 1 + i) < 43 and (mapJ - 1 + j) < 77 and (mapI - 1 + i) > 0 and (mapJ - 1 + j) > 0 then
        if (mapa[mapI - 1 + i][mapJ - 1 + j] == "G") then
          love.graphics.draw(G1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
        elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "R") then
          love.graphics.draw(R1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
        elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "P") then
          love.graphics.draw(P1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
        elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "A") then
          love.graphics.draw(A1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
        elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "M") then
          love.graphics.draw(M1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
        elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "N") then
          love.graphics.draw(N1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
        elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "B") then
          love.graphics.draw(B1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
        elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "C") then
          love.graphics.draw(C1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "D") then
          love.graphics.draw(D1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "E") then
          love.graphics.draw(E1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "F") then
          love.graphics.draw(F1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "H") then
          love.graphics.draw(H1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "I") then
          love.graphics.draw(I1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "J") then
          love.graphics.draw(J1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "K") then
          love.graphics.draw(K1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "L") then
          love.graphics.draw(L1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "2") then
          love.graphics.draw(a2,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "1") then
          love.graphics.draw(a11,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "O") then
          love.graphics.draw(O1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "P") then
          love.graphics.draw(P1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "Q") then
          love.graphics.draw(Q1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "S") then
          love.graphics.draw(S1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "t") then
          love.graphics.draw(t1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "U") then
          love.graphics.draw(U1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "V") then
          love.graphics.draw(V1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "W") then
          love.graphics.draw(W1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "X") then
          love.graphics.draw(X1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "Y") then
          love.graphics.draw(Y1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "Z") then
          love.graphics.draw(Z1,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "3") then
          love.graphics.draw(a3,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "4") then
          love.graphics.draw(a4,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "5") then
          love.graphics.draw(a5,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "6") then
          love.graphics.draw(a6,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "7") then
          love.graphics.draw(a7,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "8") then
          love.graphics.draw(a8,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
          elseif (mapa[mapI - 1 + i][mapJ - 1 + j] == "9") then
          love.graphics.draw(a9,( ( j - 1 ) * 50 ) - mapX, ( ( i - 1 ) * 50 ) - mapY )
        end
      end
    end
  end
end
function checkBoxCollision(x1,y1,w1,h1,x2,y2,w2,h2)
  return x1 < x2+w2 and x2 < x1+w1 and y1 < y2+h2 and y2 < y1+h1
end
function anda()
  if mapJ <= 68 and mapa[ mapI + 7][mapJ + 10] ~= "A" then
    if ( love.keyboard.isDown ("right") and party[1]:IsCollided() == false ) or ( love.keyboard.isDown ("right") and party[1]:IsCollided() == true and direcaoMov ~= 3 ) then
      direcaoMov = 3
      mapX = mapX + vel_mapa
      andaObjetos(1,vel_mapa*-1)
      tempoFantasia = tempoFantasia + 1
      if tempoFantasia == vel_frame_personagem then
        personagem_anim_frame = personagem_anim_frame + 1
        if personagem_anim_frame > 8 then
          personagem_anim_frame = 1
        end
        tempoFantasia = 0
      end
    end
  end
  if mapJ >= -5 then
    if ( love.keyboard.isDown ("left") and mapa[ mapI + 7][mapJ + 5] ~= "A" and party[1]:IsCollided() == false ) or ( love.keyboard.isDown ("left") and mapa[ mapI + 7][mapJ + 5] ~= "A" and party[1]:IsCollided() == true and direcaoMov ~= 4 )then
      direcaoMov = 4
      mapX = mapX - vel_mapa
      andaObjetos(1,vel_mapa)
      tempoFantasia = tempoFantasia + 1
      if tempoFantasia == vel_frame_personagem then
        personagem_anim_frame = personagem_anim_frame + 1
        if personagem_anim_frame > 8 then
          personagem_anim_frame = 1
        end
        tempoFantasia = 0
      end
    end
  end
  if mapI >= -3 then
    if ( love.keyboard.isDown ("up") and mapa[ mapI + 6][mapJ + 5] ~= "A" and party[1]:IsCollided() == false ) or ( love.keyboard.isDown ("up") and mapa[ mapI + 6][mapJ + 5] ~= "A" and party[1]:IsCollided() == true and direcaoMov ~= 2)then
      direcaoMov = 2
      mapY = mapY - vel_mapa
      andaObjetos(2,vel_mapa)
      tempoFantasia = tempoFantasia + 1
      if tempoFantasia == vel_frame_personagem then
        personagem_anim_frame = personagem_anim_frame + 1
        if personagem_anim_frame > 8 then
          personagem_anim_frame = 1
        end
        tempoFantasia = 0
      end
    end
  end
  if mapI <= 34 then
    if ( love.keyboard.isDown ("down") and (mapa[ mapI + 7][mapJ + 8] ~= "A" and mapa[ mapI + 8][mapJ + 7] ~= "Y") and party[1]:IsCollided() == false ) or ( love.keyboard.isDown ("down") and (mapa[ mapI + 7][mapJ + 8] ~= "A" and mapa[ mapI + 8][mapJ + 7] ~= "Y") and party[1]:IsCollided() == true and  direcaoMov ~= 1 ) then
      direcaoMov = 1
      mapY = mapY + vel_mapa
      andaObjetos(2,vel_mapa*-1)
      tempoFantasia = tempoFantasia + 1
      if tempoFantasia == vel_frame_personagem then
        personagem_anim_frame = personagem_anim_frame + 1
        if personagem_anim_frame > 8 then
          personagem_anim_frame = 1
        end
        tempoFantasia = 0
      end
    end
  end
  local aux_C = 0
  if mapY >= 50 then
    aux_C = mapY - 50
    mapY = aux_C
    andaObjetos(2,2)
    mapI = mapI + 1
  end
  if mapY < 0 then
    aux_C = 50 + mapY 
    mapY = aux_C
    andaObjetos(2,-1)
    mapI = mapI - 1
  end
  if mapX >= 50 then
    aux_C = mapX - 50
    mapX = aux_C
    andaObjetos(1,1)
    mapJ = mapJ + 1
  end
  if mapX < 0 then
    aux_C = 50 + mapX
    mapX = aux_C
    andaObjetos(1,-1)
    mapJ = mapJ - 1
  end
end
function printaGrade()
  for i = 0,12,1 do
    for j=1,16,1 do
       love.graphics.rectangle("line",(( j - 1 )* 50 ),(( i - 1 )* 50 ),50,50)
     end
  end
end
function dialogo(fala,personagem)
  love.graphics.draw(caixaDialogo[personagem],0,0)
  love.graphics.setFont(outra_font_p)
  if personagem == "Viking" or personagem == "Ferreiro" then
    love.graphics.print(fala,10,420) 
  else
    love.graphics.print(fala,200,420) 
  end
end
function checaMorte()
  for i=1,4,1 do     
    if 0 >=enemy[i]:GetHP() then
      enemy[i]:SetNocaute(true)
    end
  end
  for i=1,4,1 do     
    if 0 >=party[i]:GetHP() then
      party[i]:SetNocaute(true)
    end
  end
end
function acaboBattle()
  local cont = 0
  local cont2 = 0
  for i=1,4,1 do     
    if enemy[i]:IsNocaute() == true then
      cont = cont + 1
    end
  end
  for i=1,4,1 do     
    if party[i]:IsNocaute() == true then
      cont2 = cont2 + 1
    end
  end
  if cont2 == 4 then
    tela = 4
  end
  if cont == 4 then
    acaba = 1
    return true
  else
    return false
  end
end
function acao()
  aux=aux+1
      aux2=aux2+1
         escolheMovimento()  
         if menu==true and attackSucess==true  then
           attackSucess=false
          party[posicaoP]:SetTurno(false) 
           aux=0
           if posicaoP==4 then
              posicaoP = 1
              vezParty = false
            else
              posicaoP=posicaoP+1
            end
          
          end       
 end
function orderOfBattle()
  if vezParty == true then
    party[posicaoP]:SetTurno(true)
    if party[posicaoP]:IsNocaute() == false then
      acao()
    else
      if posicaoP==4 then
        posicaoP = 1
        vezParty = false
      else
        posicaoP=posicaoP+1
      end
    end
  else
      enemy[posicaoE]:SetTurno(true)
      if enemy[posicaoE]:IsNocaute() == false then
        AI()
      else
      if posicaoE==4 then
        posicaoE = 1
        vezParty = true
      else
        posicaoE=posicaoE+1
      end
    end
  end
end
function love.update(dt)
  if tela == 0 then
    saiImagem()
  end
  if tela == 1 then
    party[1]:setAnda()
    if entraBatalha == 0 then
      anda()
      colisaoBarracas()
      if jaBatalhou == false then
        if pegouEspada == true then
          colisaoBattle()
        else
            getEspadas()
            colisaoViking()
        end
      end
      if dialogoPegaEspadas == 1 and tempoVar <= tempoDialogoEspadas then
        tempo()
      end
    else
      transicao()
    end
  end
  if tela == 2 then
    party[1]:setBattle()
    orderOfBattle()
    escolheAlvo()
    checaMorte()
    powerUPIS()
    escolheAlvoHeal()
    if acaboBattle() == true then
      tela = 3
    end
  end
end
function saiImagem()
  if love.keyboard.isDown ("space") then
    tela = 1
  end
end
function colisaoViking()
    if checkBoxCollision(party[1]:GetX(),party[1]:GetY(),party[1]:GetWidth(),party[1]:GetHeight(),the_Viking:GetX()-vel_mapa,the_Viking:GetY(),the_Viking:GetWidth(),the_Viking:GetHeight()) then
      party[1]:SetCollided(true)
      dialogoVolteDepois()
      volteDepois = 1
    else
      volteDepois = 0
    end
end
function dialogoVolteDepois()
  vd = vd + 1 
  if vd == 100 then
    vd = 0 
  end
end
function transicao()
  if xt < 0 then
    xt = xt + velT
  end
  if xt < 0 then
    yt = yt + velT
  end
  if xt < 0 and yt < 0 then
    contT = contT + 5
    
  end
  if contT == 30 then
    tela = 2
    entraBatalha = 0
  end
end
function colisaoBattle()
    if checkBoxCollision(party[1]:GetX(),party[1]:GetY(),party[1]:GetWidth(),party[1]:GetHeight(),the_Viking:GetX()-vel_mapa,the_Viking:GetY(),the_Viking:GetWidth(),the_Viking:GetHeight()) then
      party[1]:SetCollided(true)
      entraBatalha = 1
      jaBatalhou = true
    end
end
function printaAtoresBatalha()
  love.graphics.draw(vceraleo,0,0)
  love.graphics.setFont(outra_font_p)
  if party[1]:IsNocaute() == false then
    if party[1]:IsTurno() == false then
      love.graphics.print(party[1]:GetHP().."/"..party[1]:GetHPT(),100,100*(1-1)+20)
      love.graphics.draw(party[1]:GetImagem()[5][1],10,100*(1-1)+20)
    else
      love.graphics.print(party[1]:GetHP().."/"..party[1]:GetHPT(),200,100*(1-1)+20)
      love.graphics.draw(party[1]:GetImagem()[5][1],100,100*(1-1)+20)
    end
  end
  for i = 2,4,1 do
    if party[i]:IsNocaute() == false then
      if party[i]:IsTurno() == false then
        love.graphics.print(party[i]:GetHP().."/"..party[i]:GetHPT(),party[i]:GetX()+100,party[i]:GetY()+100*(i-1)+20)
        love.graphics.draw(party[i]:GetImagem(),party[i]:GetX()+10,party[i]:GetY()+100*(i-1)+20)
      else
        love.graphics.print(party[i]:GetHP().."/"..party[i]:GetHPT(),party[i]:GetX()+200,party[i]:GetY()+100*(i-1)+20)
        love.graphics.draw(party[i]:GetImagem(),party[i]:GetX()+100,party[i]:GetY()+100*(i-1)+20)
      end
    end 
  end
  for i = 1,4,1 do
    if enemy[i]:IsNocaute() == false then
      if enemy[i]:IsTurno() == false then
        love.graphics.print(enemy[i]:GetHP().."/"..enemy[i]:GetHPT(),enemy[i]:GetX()-100,enemy[i]:GetY()+100*(i-1)+20)
        love.graphics.draw(enemy[i]:GetImagem(),enemy[i]:GetX(),enemy[i]:GetY()+100*(i-1)+20)
       else
        love.graphics.print(enemy[i]:GetHP().."/"..enemy[i]:GetHPT(),enemy[i]:GetX()-200,enemy[i]:GetY()+100*(i-1)+20)
        love.graphics.draw(enemy[i]:GetImagem(),enemy[i]:GetX()-100,enemy[i]:GetY()+100*(i-1)+20)
      end
    end 
  end
end
function printaMenuBatalha()
  love.graphics.setFont(minecraft_p)
  if menu== true then
    love.graphics.print("Soco",200,500)
    love.graphics.print("Arma",500,500)
    love.graphics.print("Ficar Parado",200,550)
    love.graphics.print("Vida",500,550)
    if marca==1 then
      love.graphics.rectangle("line",198,498,140,30)
    end
    if marca==2 then
      love.graphics.rectangle("line",498,498,140,30)
    end
    if marca==3 then
      love.graphics.rectangle("line",198,548,140,30)
    end
    if marca==4 then
      love.graphics.rectangle("line",498,548,140,30)
    end
  end
  if menu2 == true and alvoMarker == true then
    love.graphics.polygon("fill",enemy[enemyTarget]:GetX()-150,enemy[enemyTarget]:GetY()+100*(enemyTarget-1)+75,enemy[enemyTarget]:GetX()-200,enemy[enemyTarget]:GetY()+100*(enemyTarget-1)+50,enemy[enemyTarget]:GetX()-200,enemy[enemyTarget]:GetY()+100*(enemyTarget-1)+100)
  end
  if healthMenu==true and alvoMarkerHeal==true then
      love.graphics.polygon("fill",party[healTarget]:GetX()+150,party[healTarget]:GetY()+100*(healTarget-1)+75,party[healTarget]:GetX()+200,party[healTarget]:GetY()+100*(healTarget-1)+50,party[healTarget]:GetX()+200,party[healTarget]:GetY()+100*(healTarget-1)+100)
   end
  if escrevePowerUP==true then
    love.graphics.print("POWER UP", 370,20)
  end
  love.graphics.setFont(outra_font_p)
end
function andaObjetos(xoy,val)
  for i = 1,numObjetos,1 do
    if xoy == 1 then
      vet_barracas[i]:SetX(vet_barracas[i]:GetX() + val)
    else
      vet_barracas[i]:SetY(vet_barracas[i]:GetY() + val)
    end
  end
  if xoy == 1 then
      the_Viking:SetX(the_Viking:GetX() + val)
    else
      the_Viking:SetY(the_Viking:GetY() + val)
    end
end
function CriaBarracas()
  b1 = love.graphics.newImage("GAME SPRITES/Barracas/Azul.png") 
  b2 = love.graphics.newImage("GAME SPRITES/Barracas/Laranja.png")
  b3 = love.graphics.newImage("GAME SPRITES/Barracas/Verde.png")
  b4 = love.graphics.newImage("GAME SPRITES/Barracas/Roxo.png") 
  b5 = love.graphics.newImage("GAME SPRITES/Barracas/Arma.png") 
  b6 = love.graphics.newImage("GAME SPRITES/Barracas/Armadura.png") 
  b7 = love.graphics.newImage("GAME SPRITES/Characters/NPCs/Ferreiro/Ferreiro1.png") 
  b8 = love.graphics.newImage("GAME SPRITES/Characters/NPCs/Ferreiro/Ferreiro2.png")
  vet_barracas[1] = Barracas:new(b7,2260,195-400,130,171)
  vet_barracas[2] = Barracas:new(b8,1261,195-400,30,71)
  vet_barracas[3] = Barracas:new(b1,1400,150-400,100,150)
  vet_barracas[4] = Barracas:new(b2,1600,150-400,100,150)
  vet_barracas[5] = Barracas:new(b3,1800,150-400,100,150)
  vet_barracas[6] = Barracas:new(b4,2000,150-400,100,150)
  vet_barracas[7] = Barracas:new(b5,1200,112-400,143,150)
  vet_barracas[8] = Barracas:new(b6,2200,110-400,145,150)
  vet_barracas[9] = Barracas:new(b4,1400,150,100,150)
  vet_barracas[10] = Barracas:new(b2,1600,150,100,150)
  vet_barracas[11] = Barracas:new(b1,1800,150,100,150)
  vet_barracas[12] = Barracas:new(b4,2000,150,100,150)
  vet_barracas[13] = Barracas:new(b3,1200,150,143,150)
  vet_barracas[14] = Barracas:new(b2,2200,150,145,150)
  vet_barracas[15] = Barracas:new(b3,1400,550,100,150)
  vet_barracas[16] = Barracas:new(b4,1600,550,100,150)
  vet_barracas[17] = Barracas:new(b3,1800,550,100,150)
  vet_barracas[18] = Barracas:new(b2,2000,550,100,150)
  vet_barracas[19] = Barracas:new(b1,1200,550,143,150)
  vet_barracas[20] = Barracas:new(b1,2200,550,145,150)
 
  
  vk = love.graphics.newImage("GAME SPRITES/Characters/NPCs/Viking/Viking1.png") 
  
  the_Viking = Enemy:new("Vander",vk,3101,1111-400,40,90,100)
end
function printaObjetos()
  for i = 1,numObjetos,1 do 
    love.graphics.draw(vet_barracas[i]:GetImagem(),vet_barracas[i]:GetX(),vet_barracas[i]:GetY())
  end
  if contT < 30 then
    love.graphics.draw(the_Viking:GetImagem(),the_Viking:GetX(),the_Viking:GetY())
  end
end
function colisaoBarracas()
  for i=1,numObjetos,1 do
    if checkBoxCollision(party[1]:GetX(),party[1]:GetY(),party[1]:GetWidth(),party[1]:GetHeight(),vet_barracas[i]:GetX(),vet_barracas[i]:GetY(),vet_barracas[i]:GetWidth(),vet_barracas[i]:GetHeight()) then
 --     vet_barracas[i]:SetCollided(true)
      party[1]:SetCollided(true)
      break
    else
  --    vet_barracas[i]:SetCollided(false)
      party[1]:SetCollided(false)
      
    end
  end
end
function inicializaDialogo()
  vetDialogo[1] = Dialogo:new("Fala ai, mano. Deixa eu passar ai por favor.", "Sargeiro")
  vetDialogo[2] = Dialogo:new("Não é permitido passar daqui.", "Viking")
  vetDialogo[3] = Dialogo:new("Koe cara. Deixa eu passar.", "Sargeiro")
  vetDialogo[4] = Dialogo:new("Já falei que não é permitido passsar.", "Viking")
  vetDialogo[5] = Dialogo:new("Mas ue. Por que não?", "Sargeiro")
  vetDialogo[6] = Dialogo:new("Não te interessa...", "Viking")
  vetDialogo[7] = Dialogo:new("Eita. Vai ficar de palhaçada mesmo, mano?", "Sargeiro")
  vetDialogo[8] = Dialogo:new("...", "Viking")
  vetDialogo[9] = Dialogo:new("Vai ficar me ignorando? To ficando boladão com você...", "Sargeiro")
  vetDialogo[10] = Dialogo:new("...", "Viking")
  vetDialogo[11] = Dialogo:new("CHEGA! FIQUEI BOLADÃO!", "Sargeiro")
end 
function conversaInicial()
  timer=timer+1
 -- dialogo(vetDialogo[pos]:GetFala(), vetDialogo[pos]:GetPersonagem())
  if timer>50 then
    pos=pos+1
    if troca == 0 then
 --     dialogo(vetDialogo[pos]:GetFala(), vetDialogo[pos]:GetPersonagem())
 --       love.graphics.draw(love.graphics.newImage("GAME SPRITES/Characters/Menus/IntroFresquinha.png"),0,0)
    else
      tela=1
    end
    timer=0
  end  
  if pos == final then
    troca = 1
  end
end  
 

function getEspadas()
  if checkBoxCollision(party[1]:GetX(),party[1]:GetY(),party[1]:GetWidth(),party[1]:GetHeight(),vet_barracas[2]:GetX(),vet_barracas[2]:GetY(),vet_barracas[2]:GetWidth(),vet_barracas[2]:GetHeight()+50) then
    pegouEspada = true
    dialogoPegaEspadas = 1
  end
end
function tempo()
  tempoVar = tempoVar + 5
end
function love.draw()
  if tela == 0 then
    love.graphics.draw(tocagadodefome,0,0)
 --   conversaInicial()
  end
  if tela == 1 then
    printaMapa()
    printaObjetos()
    love.graphics.draw(party[1]:GetImagem()[direcaoMov][personagem_anim_frame],party[1]:GetX(),party[1]:GetY())
    if entraBatalha ~= 0 then
      love.graphics.setColor(0,0,0)
      love.graphics.rectangle("fill",xt,yt,800,800)
      love.graphics.setColor(255,255,255)
    end
    if vd >0 and volteDepois == 1 then
      dialogo("Niguem pode passar daqui garoto","Viking")
    end
    if dialogoPegaEspadas == 1 and tempoVar < tempoDialogoEspadas then
      dialogo("Tem um homem na ponte impedindo a passagem\nde todos, por favor leve essas espadas \ne enfrente ele.","Ferreiro")
      
    end 
    if pegouEspada == true then
      love.graphics.draw(umasentada,0,0)
    end
  end
  if tela == 2 then
    printaAtoresBatalha()
    printaMenuBatalha()
  end
  if tela == 3 then
    love.graphics.setFont(minecraft_m)
    love.graphics.print("YOU WIN !!!",250,300)
  end
  if tela == 4 then
    love.graphics.setFont(minecraft_m)
    love.graphics.print("GAME OVER !!!",220,300)
  end
end