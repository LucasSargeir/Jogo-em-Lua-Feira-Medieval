Dialogo = {}

function Dialogo:new(f,p)
  local obj = {
    fala=f,
    personagem=p
  }
  setmetatable(obj, self)
  self.__index = self
  return obj
end
function Dialogo:GetFala()
  return self.fala
end
function Dialogo:GetPersonagem()
  return self.personagem
end
