export const signup = (userForm) => {
    return $.ajax({
        method: "post",
        url: "/api/users",
        data: {user: userForm}
    });
};

export const login = (userForm) => {
    return $.ajax({
        method: "post",
        url: "/api/session",
        data: {user: userForm}
    });
};

export const logout = () => {
    return $.ajax({
        method: "delete",
        url: "/api/session"
    });
};

