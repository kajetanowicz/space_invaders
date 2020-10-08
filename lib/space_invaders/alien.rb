module SpaceInvaders
  class Alien < Bitmap
    def present?(area, detector = Detectors::Basic)
      detector.present?(self, area)
    end
  end
end
