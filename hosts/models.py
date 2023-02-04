from django.db import models

class HostModel(models.Model):
    name = models.CharField(max_length=20)
    numCPU = models.IntegerField(default=0)
    memGB = models.IntegerField(default=0)
    diskCapacity = models.IntegerField(default=0)

    def __str__(self):
        return self.name
