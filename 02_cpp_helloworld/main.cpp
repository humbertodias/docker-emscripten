extern "C" {
    const char * get_greeting() {
        const char * msg = "Hello from C++";
        return msg;
    }

    int main() {
        return 0;
    }
}