import json


def hello_world(request):
    request_json = request.get_json(silent=True)
    name = request_json.get("name", "World") if request_json else "World"
    return json.dumps({"message": f"Hello, {name}!"})
