Aliado = {}

function Aliado:new(nom,i,x, y, w, h,hpm)
  local obj = {
    nome = nom,
    imagem = i,
    px = x,
    py = y,
    width = w,
    height = h,
    collided = false,
    HP = hpm,
    HPT = hpm,
    nocaute = false,
    turno = false
  }
  setmetatable(obj, self)
  self.__index = self
  return obj
end
function Aliado:GetHPT()
  return self.HPT
end
function Aliado:IsTurno()
  return self.turno
end
function Aliado:SetTurno(h)
  self.turno = h
end
function Aliado:IsNocaute()
  return self.nocaute
end
function Aliado:SetNocaute(h)
  self.nocaute = h
end
function Aliado:MoveX(x)
  self.px = self.px + x
end
function Aliado:MoveY(y)
  self.py = self.py + y
end
function Aliado:GetX()
  return self.px
end
function Aliado:GetY()
  return self.py
end
function Aliado:GetWidth()
  return self.width
end
function Aliado:GetHeight()
  return self.height
end
function Aliado:IsCollided()
  return self.collided
end
function Aliado:SetCollided(c)
  self.collided = c
end
function Aliado:GetImagem()
  return self.imagem
end
function Aliado:GetHP()
  return self.HP
end
function Aliado:SetHP(h)
  self.HP = h
end