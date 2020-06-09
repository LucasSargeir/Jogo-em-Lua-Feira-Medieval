Barracas = {}

function Barracas:new(i,x, y, h, w)
  local obj = {
    imagem = i,
    px = x,
    py = y,
    width = w,
    height = h,
    collided = false,
  }
  setmetatable(obj, self)
  self.__index = self
  return obj
end
function Barracas:SetX(x)
  self.px =  x
end
function Barracas:SetY(y)
  self.py =  y
end
function Barracas:GetX()
  return self.px
end
function Barracas:GetY()
  return self.py
end
function Barracas:GetWidth()
  return self.width
end
function Barracas:GetHeight()
  return self.height
end
function Barracas:IsCollided()
  return self.collided
end
function Barracas:SetCollided(c)
  self.collided = c
end
function Barracas:GetImagem()
  return self.imagem
end
