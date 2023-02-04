from django.http import JsonResponse
from .models import HostModel
from .serializers import HostSerializer
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status


@api_view(['GET', 'POST'])
def hosts_list(request):
    if request.method == 'GET':
        my_hosts = HostModel.objects.all()
        host_json = HostSerializer(my_hosts, many=True)
        return JsonResponse({'hosts': host_json.data}, safe=False)

    if request.method == 'POST':
        host_json = HostSerializer(data=request.data)
        if host_json.is_valid():
            host_json.save()
            return Response(host_json.data, status=status.HTTP_201_CREATED)
