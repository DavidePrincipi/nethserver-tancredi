#!/usr/bin/env bats

#
# Copyright (C) 2020 Nethesis S.r.l.
# http://www.nethesis.it - nethserver@nethesis.it
#
# This script is part of NethServer.
#
# NethServer is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License,
# or any later version.
#
# NethServer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with NethServer.  If not, see COPYING.
#

setup () {
    load tancredi_client
}

@test "POST /tancredi/api/v1/firmware (success)" {
    run POSTFILE -F "firmware=@/etc/hosts" /tancredi/api/v1/firmware
    assert_http_code "204"
}

@test "GET /tancredi/api/v1/firmware (success)" {
    run GET /tancredi/api/v1/firmware
    assert_http_code "200"
    assert_http_body_re "^\[{"
}

@test "DELETE /tancredi/api/v1/firmware (success)" {
    run DELETE /tancredi/api/v1/firmware/hosts
    assert_http_code "204"
}

@test "DELETE /tancredi/api/v1/firmware (failed/not found)" {
    run DELETE /tancredi/api/v1/firmware/hosts
    assert_http_code "404"
}

