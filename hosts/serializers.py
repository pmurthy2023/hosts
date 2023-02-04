from rest_framework import serializers
from .models import HostModel


class HostSerializer(serializers.ModelSerializer):
    class Meta:
        model = HostModel
        fields = ['id','name', 'numCPU', 'memGB', 'diskCapacity']
