Personagem = {}

function Personagem:new(i,x, y, w, h,hpm)
  local obj = {
    imagem = i,
    px = x,
    py = y,
    width = w,
    height = h,
    collided = false,
    HP = hpm,
    HPT = hpm,
    nocaute = false,
    turno = true
    
  }
  setmetatable(obj, self)
  self.__index = self
  return obj
end
function Personagem:IsTurno()
  return self.turno
end
function Personagem:SetTurno(h)
  self.turno = h
end
function Personagem:IsNocaute()
  return self.nocaute
end
function Personagem:SetNocaute(h)
  self.nocaute = h
end
function Personagem:MoveX(x)
  self.px = self.px + x
end
function Personagem:MoveY(y)
  self.py = self.py + y
end
function Personagem:GetX()
  return self.px
end
function Personagem:GetY()
  return self.py
end
function Personagem:GetWidth()
  return self.width
end
function Personagem:GetHeight()
  return self.height
end
function Personagem:IsCollided()
  return self.collided
end
function Personagem:SetCollided(c)
  self.collided = c
end
function Personagem:GetImagem()
  return self.imagem
end
function Personagem:GetHP()
  return self.HP
end
function Personagem:GetHPT()
  return self.HPT
end
function Personagem:SetHP(h)
  self.HP = h
end
function Personagem:setAnda()
    self.px=360
    self.py=300
  end
  
  function Personagem:setBattle()
    self.px=0
    self.py=0
   
 end
  