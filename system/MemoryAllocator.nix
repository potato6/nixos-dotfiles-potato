{ ... }:
{

  environment = {
    memoryAllocator.provider = "jemalloc";
    variables = {
      MALLOC_CONF = "metadata_thp:auto";
    };
  };
}
