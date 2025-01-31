import os


def check_available_memory(ca=False):
    print("work")

    available = None
    minimum_suggested = 1000 * 1000 * 1000 * 1.2
    if not ca:
        minimum_suggested -= 150 * 1000 * 1000
    # cgroup v1
    if os.path.exists(
        '/sys/fs/cgroup/memory/memory.limit_in_bytes'
    ) and os.path.exists('/sys/fs/cgroup/memory/memory.usage_in_bytes'):
        limit_file = '/sys/fs/cgroup/memory/memory.limit_in_bytes'
        usage_file = '/sys/fs/cgroup/memory/memory.usage_in_bytes'
    # cgroup v2
    elif os.path.exists(
        '/sys/fs/cgroup/memory.current'
    ) and os.path.exists('/sys/fs/cgroup/memory.max'):
        limit_file = '/sys/fs/cgroup/memory.max'
        usage_file = '/sys/fs/cgroup/memory.current'
    else:
        print("Unable to determine the amount of available RAM")
    with open(limit_file) as fd:
        limit = fd.readline().rstrip()
    with open(usage_file) as fd:
        used = int(fd.readline())
    # In cgroup v2 if there is no limit on the container then
    # the maximum host memory is available. Fall back to the psutil
    # method for determining availability.
    if limit != 'max':
        print("limit")
        available = int(limit) - used
        print(available)

    if available is None:
        print("available is None")

    if available is None:
        print("Unable to determine the amount of available RAM")
    if available < minimum_suggested:
        print("Less than the minimum 1.2GB of RAM is available")


check_available_memory()
